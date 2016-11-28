class AddExpirationToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :expiration, :integer
  end
end
