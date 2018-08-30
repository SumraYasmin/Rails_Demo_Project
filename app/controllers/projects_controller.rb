class ProjectsController < ApplicationController
  before_action :validate_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.user?
      @projects = current_user.projects.order_desc.includes(:client)
    else
      @projects = Project.order_desc.includes(:client)
    end
  end

  def show
    @timelogs = @project.time_logs.order_desc.first(5)
    @payments = @project.payments.order_desc.first(5)
  end

  def new
    @project = Project.new
    select_options
  end

  def edit
    select_options
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      select_options
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      select_options
      render :edit
    end
  end

  def destroy
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

    def validate_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end

    def select_options
      @clients = Client.all
      @users = User.all
    end
end
