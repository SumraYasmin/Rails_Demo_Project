class TimeLog < ApplicationRecord
  validates :hours, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :date, presence: true

  belongs_to :project
  belongs_to :user
end
