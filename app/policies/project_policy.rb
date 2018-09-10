class ProjectPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  def allowed?
    user.user? ? false : true
  end
end
