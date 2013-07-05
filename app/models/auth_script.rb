# Author: Mike Hagerty,  11/28/2012
 
# The purpose of this script is to pull data from the Yahoo Sports API.  I tried to document the steps as thoroughly as possible, as I had a 
# tough time navigating this process
 
# Yahoo Sports requires Oauth authentication for personal team-related data.  This requirement complicates the automation of pulling data, as Oauth in general requires user interaction to complete the authentication process.
# Mechanize is used to automate the user interaction steps required to authenticated via Oauth.  
# This script also has example code for storing the data in a mongodb at the end
 
#!/usr/bin/ruby
 
require 'oauth'
require 'uri'
require 'json'
require 'mechanize'
 
# EDIT THESE USER VALUES FOR YOUR SPECIFIC SCRIPT
# Yahoo Oauth Variables
# Yahoo Consumer Secret
@consumer_key = "dj0yJmk9ZXdJTWo1NGtRYXBhJmQ9WVdrOWJ6SjNZM0l4TjJVbWNHbzlPVEkyTXpNNU9UWXkmcz1jb25zdW1lcnNlY3JldCZ4PTlk"
# Yahoo Consumer Secret
@consumer_secret = "f6636fec793e7f7c673036f35b72e303bc1b11c0"
 
# Yahoo User Credentials 
# Yahoo User ID
@yahoo_user_id = 'blaneisfast'
# Yahoo User Password
@yahoo_password = 'Mets2012'
 
# DO NOT EDIT THESE VALUES
# Oauth variables
# Yahoo Oauth Request Token Path
@yahoo_oauth_request_token_path = '/oauth/v2/get_request_token'
# Yahoo Oauth Access Token Path
@yahoo_oauth_access_token_path = '/oauth/v2/get_token'
# Yahoo Oauth Authorize Path
@yahoo_oauth_authorize_path = '/oauth/v2/request_auth'
# Eng Yahoo Oauth Variables
# Yahoo URLs
# Yahoo User Login Settings
# Yahoo User Login URL
@yahoo_user_login_url = "https://login.yahoo.com/"
# Yahoo Sport API Oauth URL
@yahoo_oauth_url = "https://api.login.yahoo.com"
# End Yahoo User Login Settings
# Mechanize Settings for Yahoo
# Yahoo Login form name, found through browser inspection
@yahoo_login_form_name = 'login_form'
# Yahoo Login Username Field Name, found through browser inspection
@yahoo_login_username_fieldname = 'login'
# Yahoo Login Password Field Name, found through browser inspection
@yahoo_login_password_fieldname = 'passwd'
# Yahoo Agreement Page Acceptance form name, found through browser inspection
@yahoo_acceptance_form_name = 'rcForm'
# Name of verifier span name, found through browser inspection
@verifier_code_span_name = 'shortCode'
# End Mechanize Settings for Yahoo
 
 
# Logs into Yahoo using Mechanize, sets session cookies, authenticates and grabs access token for oauth, grabs json and converts to json object hash
def retrieve_yahoo_data()
  
  # Sets up parameters to grab Oauth request token
  @auth_consumer=OAuth::Consumer.new @consumer_key, 
                  @consumer_secret, {
                  :site          => @yahoo_oauth_url,
                  :scheme               => :query_string,
                  :request_token_path   => @yahoo_oauth_request_token_path,
                  :access_token_path    => @yahoo_oauth_access_token_path,
                  :authorize_path       => @yahoo_oauth_authorize_path
                   }
 
  # Set request token 
  @request_token = @auth_consumer.get_request_token
   
  # initiate Mechanize agent
  myagent = Mechanize.new
  
  # disregard SSL certs, this causes a problem on Windows
  myagent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
 
  # LOGIN TO YAHOO AND SET REQUIRED COOKIES
  newpage1 = myagent.get @yahoo_user_login_url
  # puts "Going to Yahoo Login Page"
  temp_jar = myagent.cookie_jar
  #puts temp_jar.inspect # prints cookies
  submit_form = newpage1.form_with(name: @yahoo_login_form_name) # find form name of form that submits the login
  submit_form.field_with(name: @yahoo_login_username_fieldname).value = @yahoo_user_id
  submit_form.field_with(name: @yahoo_login_password_fieldname).value = @yahoo_password
  newpage2 = submit_form.click_button
  myagent.cookie_jar = temp_jar 
  #puts temp_jar.inspect #prints cookies
  #END LOGIN PROCESS
 
  # MAKE OAUTH REQUEST
  # Gets authentication page first when requesting auth_url
  agreement_page = myagent.get(@request_token.authorize_url)
  # puts "Going to Agreement Page"
      
  # Find form to be submitted when you click Agree
  agreement_form = agreement_page.form_with(name: @yahoo_acceptance_form_name)
  #Set Verifier Page by accepting the default Accept form
  verifier_code_page = agreement_form.click_button # clicks first submit button
  # puts "Going to Verifier Code Page"
  verifier_code_html = verifier_code_page.search('//span[starts-with(@id, @verifier_code_span_name)]') # returns span html
  verifier_code = verifier_code_html.children.text # Nokogiri, the embedded parser within Mechanize, returns the full span text, but calling children will put the text of the span
  # puts "Verifier Code is: " + verifier_code # 
 
  @access_token=@request_token.get_access_token(:oauth_verifier => verifier_code)
  # puts "Access Token is: " + @access_token.token   
  # use the token to make the GET request to retrieve the data.  The access_token instance can issue network requests.
  # Pass the Yahoo URL, with the alreasy created auth token, to get the results from the Yahoo API
  @json_response = @access_token.request(:get, @yahoo_sports_url) # returns a Net::HTTPOK object, which needs to be converted to a JSON hash to be imported into Mongo
  @json_hash = JSON.parse(@json_response.body) # converts the Net object to a Hash
end

 
retrieve_yahoo_data
