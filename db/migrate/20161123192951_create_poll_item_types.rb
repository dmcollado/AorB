class CreatePollItemTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_item_types do |t|
      t.string :code
      t.string :type
      t.references :poll_item, foreign_key: true

      t.timestamps
    end
  end
end
