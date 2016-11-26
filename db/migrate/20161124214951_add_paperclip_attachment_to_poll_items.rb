class AddPaperclipAttachmentToPollItems < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :poll_items, :avatar_a
  	add_attachment :poll_items, :avatar_b
  end
end
