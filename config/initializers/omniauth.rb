Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo, YAHOO_CONFIG['YAHOO_TOKEN'], YAHOO_CONFIG['YAHOO_SECRET']
  provider :cbs, CBS_CONFIG['CBS_TOKEN'], CBS_CONFIG['CBS_SECRET']
end

