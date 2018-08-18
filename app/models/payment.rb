class Payment < ApplicationRecord
  validates :amount, :date, presence: true
  belongs_to :project
end
