Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]

  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"],
    client_options: {
      scope: "public_profile,email,user_friends",
      info_fields: "name,email,picture",
      site: 'https://graph.facebook.com/v2.8',
      authorize_url: "https://www.facebook.com/v2.8/dialog/oauth",
      callback_url: "http://www.this-or-that.co/facebook/callback"
    }

end
