class PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update, :destroy]
  before_action :validates_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy

  def new
    find_project
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.project_id = params[:project_id]

    if @payment.save
      redirect_to projects_path, notice: 'Payment was successfully created.'
    else
      find_project
      render :new
    end
  end

  def edit
    find_project
  end

  def update
    find_project
    if @payment.update(payment_params)
      redirect_to @project, notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    find_project
    @payment.destroy
    redirect_to @project, notice: 'Payment was successfully destroyed.'
  end

  private

    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :date)
    end

    def validates_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end

    def find_project
      @project = Project.find(params[:project_id])
    end
end
