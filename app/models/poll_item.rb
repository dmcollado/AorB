class PollItem < ApplicationRecord
  belongs_to :poll
  has_one :poll_item_type

  has_attached_file :avatar_a, :styles => {:large => ['800>', :jpg, :quality => 65]}, :convert_options => {:large => '-set colorspace sRGB -strip'}, :default_style => :large
  
  has_attached_file :avatar_b, :styles => {:large => ['800>', :jpg, :quality => 65]}, :convert_options => {:large => '-set colorspace sRGB -strip'}, :default_style => :large

  validates_attachment_content_type :avatar_a, :content_type => /^image\/(png|gif|jpeg|jpg)/

  validates_attachment_content_type :avatar_b, :content_type => /^image\/(png|gif|jpeg|jpg)/

end
