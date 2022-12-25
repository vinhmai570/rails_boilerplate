# frozen_string_literal: true

class Admin::ProfileController < Admin::BaseController
  before_action :set_admin, only: %i[index update password update_password]

  def index; end

  def update
    if @admin.update(admin_params)
      redirect_to admin_profile_index_path, notice: 'Profile was successfully updated.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def password; end

  def update_password
    return redirect_to password_admin_profile_index_path, alert: 'Old password is wrong, please check it!' unless
      @admin.valid_password?(params[:admin][:old_password])

    return redirect_to password_admin_profile_index_path, notice: 'Password was successfully updated.' if
      @admin.valid? && @admin.update(password_params)

    render :password, status: :unprocessable_entity
  end

  private

  def set_admin
    @admin = current_admin
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :avatar)
  end

  def password_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
