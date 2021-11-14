class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful!'
      redirect_to dashboard_index_path
    else
      flash[:danger] = 'Something went horribly wrong!'
      redirect_to root_path
    end
  end
end
