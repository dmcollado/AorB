class Poll < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :poll_items

  accepts_nested_attributes_for :poll_items

end
