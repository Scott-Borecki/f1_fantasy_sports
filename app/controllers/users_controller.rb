class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.create!(user)
    session[:user_id] = new_user.id
    flash[:success] = 'Registration successful!'
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
