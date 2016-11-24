class PollItem < ApplicationRecord
  belongs_to :poll
  belongs_to :poll_item_type
end
