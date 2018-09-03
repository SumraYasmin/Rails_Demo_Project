class Api::V1::TimeLogsController < Api::V1::ApplicationController
  before_action :set_project, only: [:index]

  def index
    @timelogs = @project.time_logs.order_desc
    render json: @timelogs
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end
end
