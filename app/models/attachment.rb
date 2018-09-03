class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :file, styles: {thumb: "100x100#"}
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
