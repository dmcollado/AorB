class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.string :comment
      t.string :session_id
      t.references :poll, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
