class User < ApplicationRecord
  scope :except_admins, -> { where.not(role: :admin) }
  validates :first_name, :last_name, presence: true
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin, :manager]
  enum status: [:active, :inactive]

  has_many :assignments
  has_many :projects, through: :assignments

  def active_for_authentication?
    super and self.active?
  end

  def update_user_status
    self.active? ? self.inactive! : self.active!
  end

  def update_user_role
    self.manager? ? self.user! : self.manager!
  end

  def user_name
    [self.first_name.humanize, ' ', self.last_name.humanize].join
  end

  def get_toggled_status
    self.active? ? "Inactivate" : "Activate"
  end

   def get_toggled_role
    self.user? ? "Promote" : "Demote"
  end
end
