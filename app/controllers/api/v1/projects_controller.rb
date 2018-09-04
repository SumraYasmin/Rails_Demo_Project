class Api::V1::ProjectsController < Api::V1::ApiController
  before_action :set_project, only: [:show]

  def index
    if current_user.user?
      @projects = current_user.projects.order_desc.includes(:time_logs)
    else
      @projects = Project.order_desc.includes(:time_logs)
    end
    render json: @projects
  end

  def show
    render json: @project
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end
end
