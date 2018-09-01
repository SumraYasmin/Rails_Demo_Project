class ApplicationRecord < ActiveRecord::Base
  include ThinkingSphinx::Scopes

  self.abstract_class = true

  scope :order_desc, -> { order(id: :desc) }
end
