class ProjectPolicy < ApplicationPolicy
  def destroy?
    user.admin? ? true : false
  end

  def allowed?
    user.user? ? false : true
  end
end
