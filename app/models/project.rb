class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  enum status: [:not_started, :in_progress, :on_hold, :compeleted]

  belongs_to :client

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :payments, dependent: :destroy
  has_many :time_logs, dependent: :destroy

  def self.status_map
    statuses.map {|key, value| [key.humanize, key]}
  end

  def self.projects_earning
    joins(:time_logs)
    .group(:project_id)
    .order("earning_per_hour desc")
    .pluck("projects.title, sum(time_logs.hours) as total_hours, (projects.cost/(sum(time_logs.hours))) as earning_per_hour")
  end
end
