class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: [:user, :admin, :manager]
  enum status: [:active, :inactive]
  after_initialize :set_default_role, :set_default_status,  :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def set_default_status
    self.status ||= :active
  end

   before_create do
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
