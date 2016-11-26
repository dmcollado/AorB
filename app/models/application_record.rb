class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  has_attached_file :avatar
  # Validate content type
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar
end
