class DashboardController < ApplicationController
  def index
    @current_user ||= current_user
    @user_teams = @current_user.user_teams
  end
end
