class PollItem < ApplicationRecord
  belongs_to :poll
  # has_one :poll_item_type

  has_attached_file :avatar_a
  has_attached_file :avatar_b

  validates_attachment_content_type :avatar_a, :content_type => /^image\/(png|gif|jpeg|jpg)/
  validates_attachment_content_type :avatar_b, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
