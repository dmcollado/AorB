class User < ApplicationRecord
  # validates :provider, presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.picture = auth.info.image if auth.info.image.present?   	
    end
  end
end
