class AddPaperclipAttachmentToPollItems < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :poll_items, :avatar
  end
end
