class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :poll_item_a
      t.string :poll_item_b
      t.string :description
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
