class ManagerViewController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @users = User.all
    @departments = Department.all.order(:id)
    @unassigned_shifts = unassigned_shifts

  end

  def hr_overview
    true
  end

  def planner
  end

  private

  # dashboard methods
  def unassigned_shifts
    @shifts = Shift.all
    @unassigned_shifts = []

    @shifts.each do |shift|
      if shift.user == nil
       @unassigned_shifts << shift
      end
    end
    return @unassigned_shifts

  end


end
