class CreatePollItems < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_items do |t|
      t.integer :score
      t.boolean :item_a
      t.string :url
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
