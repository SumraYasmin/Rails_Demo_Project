class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_desc, -> { order(id: :desc) }
end
