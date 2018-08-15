class Project < ApplicationRecord
  validates :title, :client_id, presence: true
  validates :title, uniqueness: true

  enum status: [:not_started, :in_progress, :on_hold, :compeleted]

  belongs_to :client

  has_many :assignments
  has_many :users, through: :assignments
end
