class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @projects = Project.projects_earning
    @top_projects = @projects.first(5)
    @bottom_projects = @projects.last(5)
    @monthly_timelogs = TimeLog.get_monthly_timelogs
    @monthly_payments = Payment.get_monthly_payments
  end
end
