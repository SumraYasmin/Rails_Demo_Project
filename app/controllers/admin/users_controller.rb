class Admin::UsersController < Admin::AdminController
  before_action :validates_role, only: [:update_status, :update_role, :destroy]

  def index
    @users = User.except_admins
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  def update_status
    @user.update_user_status
    redirect_to admin_users_path, notice: 'User status is updated successfully.'
  end

  def update_role
    @user.update_user_role
    redirect_to admin_users_path, notice: 'User role is updated successfully.'
  end

  private

    def validates_role
      set_user

      redirect_to(admin_users_path, alert: 'Admin can not be updated.') if @user.admin?
    end

    def set_user
      @user = User.find(params[:id])
    end
end
