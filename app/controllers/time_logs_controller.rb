class TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create, :index]

  def index
    @timelogs = @project.time_logs.order_desc
  end

  def new
    @timelog = TimeLog.new
  end

  def edit
  end

  def create
    @timelog = @project.time_logs.new(timelog_params)
    @timelog.user_id = current_user.id

    if @timelog.save
      flash.now[:notice] = 'Timelog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @timelog.update(timelog_params)
      flash.now[:notice] = 'Timelog was successfully updated.'
    else
      set_project
      render :edit
    end
  end

  def destroy
    @timelog.destroy
    redirect_to :back, notice: 'Timelog was successfully destroyed.'
  end

  private

    def set_time_log
      @timelog = TimeLog.find(params[:id])
    end

    def timelog_params
      params.require(:time_log).permit(:hours, :date)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
