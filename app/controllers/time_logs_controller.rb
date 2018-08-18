class TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  def new
    find_project
    @timelog = TimeLog.new
  end

  def edit
    find_project
  end

  def create
    @timelog = TimeLog.new(timelog_params)
    @timelog.project_id = params[:project_id]
    @timelog.user_id = current_user.id

    if @timelog.save
      redirect_to projects_path, notice: 'Timelog was successfully created.'
    else
      find_project
      render :new
    end
  end

  def update
    find_project
    if @timelog.update(timelog_params)
      redirect_to @project, notice: 'Timelog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    find_project
    @timelog.destroy
    redirect_to @project, notice: 'Timelog was successfully destroyed.'
  end

  private

    def set_time_log
      @timelog = TimeLog.find(params[:id])
    end

    def timelog_params
      params.require(:time_log).permit(:hours, :date)
    end

    def find_project
      @project = Project.find(params[:project_id])
    end
end
