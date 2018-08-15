module UsersHelper
  def status_class(status)
    case status
      when "active"   then "btn btn-danger"
      when "inactive" then "btn btn-success"
    end
  end

  def role_base_class(user)
    {
      'user'    => 'btn btn-success',
      'manager' => 'btn btn-danger',
    }[user.role]
  end

  def role_class(user)
    klasses = role_base_class(user)

    user.active? ? klasses : (klasses << ' disabled')
  end
end
