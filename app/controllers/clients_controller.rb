class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.search ThinkingSphinx::Query.escape(params[:search].to_s), page: params[:page], per_page: 5
  end

  def show
  end

  def new
    @client = Client.new
    authorize @client, :allowed?
  end

  def edit
    authorize @client, :allowed?
  end

  def create
    @client = Client.new(client_params)
    authorize @client, :allowed?

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @client, :allowed?
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @client
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
end
