class Client < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise::email_regexp

  has_many :projects

  def name
     [self.first_name.humanize, ' ', self.last_name.humanize].join
  end
end
