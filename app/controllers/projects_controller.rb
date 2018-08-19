class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :all_payments, :all_time_logs]
  before_action :validates_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy

  def index
    if current_user.user?
      @projects = current_user.projects.order_desc.includes(:client)
    else
      @projects = Project.order_desc.includes(:client)
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
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
      params.require(:project).permit(:title, :description, :status, :client_id, :start_date, :cost, user_ids: [])
    end

    def validates_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end
end
