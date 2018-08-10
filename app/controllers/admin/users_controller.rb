class Admin::UsersController < AdminController
  before_action :set_user, only: [:update_status, :update_role]
  before_action :validates_role, only: :update_status

  def index
    @users = User.all.except_admins
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'User was successfully destroyed.'
  end

  def update_status
    @user.update_user_status
    redirect_to admin_users_url, notice: 'User status is updated successfully.'
  end

  def update_role
    @user.update_user_role
    redirect_to admin_users_url, notice: 'User role is updated successfully.'
  end

  private

    def validates_role
      set_user

      redirect_to(admin_users_url, alert: 'Admin role can not be updated.') if @user.admin?
    end

    def set_user
      @user = User.find(params[:id])
    end
end
