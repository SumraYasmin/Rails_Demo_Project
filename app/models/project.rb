class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  enum status: [:not_started, :in_progress, :on_hold, :compeleted]

  belongs_to :client

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :payments, dependent: :destroy
  has_many :time_logs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  def self.status_map
    statuses.map {|key, value| [key.humanize, key]}
  end
end
