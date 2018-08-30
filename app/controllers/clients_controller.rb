class ClientsController < ApplicationController
  before_action :validates_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Client was successfully destroyed.'
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :location)
    end

    def validates_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end
end
