class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :order_desc, -> { order(id: :desc) }
  scope :latest, -> { order_desc.first(5) }
end
