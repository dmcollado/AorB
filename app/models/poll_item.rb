class PollItem < ApplicationRecord
  belongs_to :poll
  has_one :poll_item_type

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
