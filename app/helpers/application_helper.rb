module ApplicationHelper
  def flash_class(level)
    case level
      when "success" then "alert alert-success alert-dismissible"
      when "error"   then "alert alert-error alert-dismissible"
      when "alert"   then "alert alert-info alert-dismissible"
      when "notice"  then "alert alert-success alert-dismissible"
    end
  end

  def icon_class(key,path)
    case key
      when "Show"      then  link_to path, class: "btn btn-info btn-md"   do content_tag :span, " ", class: "glyphicon glyphicon-eye-open" end
      when "Edit"      then  link_to path, class: "btn btn-info btn-md"   do content_tag :span, " ", class: "glyphicon glyphicon-edit" end
      when "Delete"    then  link_to path, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-md" do content_tag :span, " ", class: "glyphicon glyphicon-trash" end
    end
  end
end
