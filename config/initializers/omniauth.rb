Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]

  provider :twitter, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"]

end
