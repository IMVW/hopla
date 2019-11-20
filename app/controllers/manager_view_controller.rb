class ManagerViewController < ApplicationController
  def dashboard
    employees_in_today
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
