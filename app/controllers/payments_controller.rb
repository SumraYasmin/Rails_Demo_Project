class PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update, :destroy]
  before_action :validates_role, only: [:new, :edit, :update, :create]
  before_action :validates_admin, only: :destroy

  def new
    set_project
    @payment = @project.payments.build
  end

  def edit
    set_project
    @payment = @project.payments.find(params[:id])
  end

  def create
    set_project
    @payment = @project.payments.build(payment_params)

    if @payment.save
      redirect_to projects_path, notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  def update
    set_project
    @payment = @project.payments.find(params[:id])
    if @payment.update(payment_params)
      redirect_to @project, notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_project
    @payment = @project.payments.find(params[:id])
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

    def set_project
      @project = Project.find(params[:project_id])
    end
end
