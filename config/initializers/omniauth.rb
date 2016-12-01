Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]

  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"],
    client_options: {
      site: 'https://graph.facebook.com/v3.0',
      authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
    }

end
