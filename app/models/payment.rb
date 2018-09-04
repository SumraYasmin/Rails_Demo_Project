class Payment < ApplicationRecord
  validates :amount, :date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :project

  def self.get_monthly_payments
    where('payments.date >= ? AND payments.date <= ?', Time.zone.now.beginning_of_month, Time.zone.now.end_of_month)
    .joins(:project)
    .group('projects.title').sum(:amount)
  end
end
