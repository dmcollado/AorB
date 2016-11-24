class Poll < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :poll_items
end
