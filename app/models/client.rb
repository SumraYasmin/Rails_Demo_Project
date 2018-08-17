class Client < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise::email_regexp

  has_many :projects, dependent: :destroy

  def name
     [self.first_name, ' ', self.last_name].join.humanize
  end
end
