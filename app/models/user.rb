class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  has_many :teams, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name


  #TODO: NEED TO REMOVE THIS CODE
   def get_nfl
    auth = self.authentications.find(:first, :conditions => { :provider => 'yahoo'}) if self
    access_token = prepare_access_token(auth[:token], auth[:secret])
    yahoo_guid = access_token.params[:xoauth_yahoo_guid]

    response = access_token.request(:get, 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games/leagues' )
  end

  def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new(YAHOO_CONFIG['YAHOO_TOKEN'], YAHOO_CONFIG['YAHOO_SECRET'],
                                   {:site => 'https://api.login.yahoo.com',
                                    :request_token_path => '/oauth/v2/get_request_token',
                                    :access_token_path => '/oauth/v2/get_token',
                                    :authorize_path => '/oauth/v2/request_auth',
                                    :signature_method => 'HMAC-SHA1',
                                    :oauth_version => '1.0',
                                    :http_method => :get})


    # raise request_token.inspect

    access_token = request_token.get_access_token
    # raise access_token.inspect

    token_hash = { :oauth_token => oauth_token, :oauth_secret => oauth_token_secret}

    # access_token = OAuth::AccessToken.from_hash(consumer, token_hash)  #TODO This only works with single user (i.e public twitter). I need to get a request token and
    return access_token
  end

#need to work on this for refreshing user tokens
  # def refresh!
  #   old_one = self
  #   request_token = OAuth::RequestToken.new(YahooToken.consumer, self.token, self.secret)

  #   options={}
  #   options[:oauth_session_handle]=self.session_handle

  #   access_token = request_token.get_access_token options
  #   new_one = YahooToken.find_or_create_from_access_token self.user, access_token

  #   if new_one
  #     old_one.delete
  #     return new_one
  #   end

  #   return nil
  # end
end
