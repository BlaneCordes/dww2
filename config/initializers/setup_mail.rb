# ActionMailer::Base.smtp_settings = {
# 	:address => "smtp.gmail.com",
# 	:port => 587,
# 	:domain => "dailywaiverwire.com",
# 	:user_name => "dailywaiverwire@gmail.com",
# 	:password => "Stag1985",
# 	:authentication => "plain",
# 	:enable_starttls_auto => true
# }

# ActionMailer::Base.default_url_options[:host] = "localhost:3000"

ActionMailer::Base.smtp_settings = {
  :address  => "smtp.someserver.net",
  :port  => 25,
  :user_name  => "someone@someserver.net",
  :password  => "mypass",
  :authentication  => :login
}