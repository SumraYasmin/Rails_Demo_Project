class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :validates_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    get_clients
    get_users
  end

  def edit
    get_clients
    get_users
  end

  def create
    @project = Project.new(project_params)
    params[:users][:id].each do |user|
      if !user.empty?
        @project.assignments.build(user_id: user)
      end
    end

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
      params.require(:project).permit(:title, :description, :status, :client_id, :start_date, :cost)
    end

    def validates_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end

    def get_clients
      @all_clients = Client.all
    end

    def get_users
      @all_users = User.all
      @project_user = @project.assignments.build
    end

end
