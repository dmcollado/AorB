class RemovePollItemAAndPollItemBFromPolls < ActiveRecord::Migration[5.0]
  def change
  	remove_columns :polls, :poll_item_a, :poll_item_b
  end
end
