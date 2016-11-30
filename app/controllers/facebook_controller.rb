class FacebookController < ApplicationController
  def token
    profile = Facebook.profile(params[:token])
    render plain: profile
  end
end
