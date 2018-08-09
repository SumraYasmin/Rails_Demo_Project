class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: [:user, :admin, :manager]
  enum status: [:active, :inactive]
end
