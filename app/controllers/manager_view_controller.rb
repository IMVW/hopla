class ManagerViewController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @users = User.all
    @departments = Department.all

  end

  def hr_overview
    true
  end

  def planner
  end

  private

  # dashboard methods
  def employees_in_today
  end


end
