class ManagerViewController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    employees_in_today
    @user = current_user
  end

  def hr_overview
    true
  end

  def planner
  end

  private

  # dashboard methods
  def employees_in_today
    @employees_in_today = 1
  end

  # HR overview methods
end
