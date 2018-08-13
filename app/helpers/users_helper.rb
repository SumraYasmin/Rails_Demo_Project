module UsersHelper
  def status_class(status)
    case status
      when "active"   then "btn btn-danger"
      when "inactive" then "btn btn-success"
    end
  end

  def role_class(user)
    if user.active?
      case user.role
        when "user"    then "btn btn-success"
        when "manager" then "btn btn-danger"
      end
    else
      case user.role
        when "user"    then "btn btn-success disabled"
        when "manager" then "btn btn-danger disabled"
      end
    end
  end
end
