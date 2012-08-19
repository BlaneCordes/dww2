Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo, YAHOO_CONFIG['YAHOO_TOKEN'], YAHOO_CONFIG['YAHOO_SECRET']
end

