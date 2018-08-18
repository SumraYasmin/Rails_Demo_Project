class Payment < ApplicationRecord
  validates :amount, :date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 1000 }

  belongs_to :project
end
