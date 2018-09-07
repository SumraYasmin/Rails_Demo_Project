class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    with_clause = current_user.user? ? {user_id: current_user.id} : {}

    @projects = Project.search(params[:search], with: with_clause, page: params[:page], per_page: 5, sql: {include: :client})
  end

  def show
    @timelogs = @project.time_logs.order_desc.first(5)
    @payments = @project.payments.order_desc.first(5)
  end

  def new
    @project = Project.new
    authorize @project, :allowed?
    select_options
  end

  def edit
    authorize @project, :allowed?
    select_options
  end

  def create
    @project = Project.new(project_params)
    authorize @project, :allowed?
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      select_options
      render :new
    end
  end

  def update
    authorize @project, :allowed?
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      select_options
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :status, :client_id, :start_date, :cost, user_ids: [], attachments_attributes: [:file, :id, :_destory])
    end

    def select_options
      @clients = Client.all
      @users = User.all
    end
end
