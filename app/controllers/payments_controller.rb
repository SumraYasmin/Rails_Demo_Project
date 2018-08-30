class PaymentsController < ApplicationController
  before_action :validate_role, only: [:new, :edit, :update, :create]
  before_action :set_project, only: [:create, :new, :edit, :index]
  before_action :validates_admin, only: :destroy
  before_action :set_payment, only: [:edit, :update, :destroy]

  def index
    @payments = @project.payments.order_desc
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = @project.payments.new(payment_params)
    if @payment.save
      flash.now[:notice] = 'Payment was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      flash.now[:notice] = 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to :back, notice: 'Payment was successfully destroyed.'
  end

  private

    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :date)
    end

    def validate_role
      redirect_to(clients_path, notice: 'You can not perform this action.') if current_user.user?
    end

    def validates_admin
      redirect_to(clients_path, notice: 'You can not perform this action.') unless current_user.admin?
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
