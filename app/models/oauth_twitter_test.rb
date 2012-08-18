class OauthTwitterTest
  
  consumer = Oauth::Consumer.new(twitter_token, twitter_key,
                                 { :site => "http://twitter.com",
                                   :request_token_path => '/oauth/request_token' , 
                                   :acces_token_path =>  "",
                                   :authorize_path => 
  })
end
