class Poll < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :poll_items

  accepts_nested_attributes_for :poll_items

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg|jpg)/

end
