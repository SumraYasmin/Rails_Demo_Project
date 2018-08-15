module ApplicationHelper
  def flash_class(level)
    case level
      when "success" then "alert alert-success alert-dismissible"
      when "error"   then "alert alert-error alert-dismissible"
      when "alert"   then "alert alert-info alert-dismissible"
      when "notice"  then "alert alert-success alert-dismissible"
    end
  end

  def icon_of(klass)
    content_tag :span, " ", class: "glyphicon #{klass}"
  end
end
