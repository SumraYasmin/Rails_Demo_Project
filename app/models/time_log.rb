class TimeLog < ApplicationRecord
  validates :hours, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :date, presence: true

  belongs_to :project
  belongs_to :user

  def self.get_cur_month_timelogs
    where('time_logs.date >= ? AND time_logs.date <= ?', Time.zone.now.beginning_of_month, Time.zone.now.end_of_month)
    .joins(:project)
    .group('projects.title').sum(:hours)
  end
end
