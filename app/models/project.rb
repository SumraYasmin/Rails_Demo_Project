class Project < ApplicationRecord
  validates :title, :client_id, presence: true
  validates :title, uniqueness: true

  enum status: [:not_started, :in_progress, :on_hold, :compeleted]

  belongs_to :client

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :payments, dependent: :destroy
end
