class AdminController < ApplicationController
  before_action :validate_admin

  def validate_admin
    redirect_to(root_path) unless current_user.admin?
  end
end
