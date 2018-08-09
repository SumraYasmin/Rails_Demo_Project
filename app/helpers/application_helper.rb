module ApplicationHelper
  def flash_class(level)
    case level
      when "success" then "alert alert-success"
      when "error" then "alert alert-error"
      when "alert" then "alert alert-info"
      when "notice" then "alert alert-success"
        
    end
  end
end
