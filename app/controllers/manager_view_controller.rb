class ManagerViewController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @users = User.all
    @departments = Department.all.order(:id)
    @unassigned_shifts = unassigned_shifts
    @greet = greet
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
      if shift.user == nil && shift.start_time >= Time.now + 2.day
       @unassigned_shifts << shift
      end
    end
    return @unassigned_shifts
  end

  def greet
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    case
    when midnight.upto(noon).include?(current_time)
      return "Good Morning"
    when noon.upto(five_pm).include?(current_time)
      return  "Good Afternoon"
    when five_pm.upto(eight_pm).include?(current_time)
      return  "Good Evening"
    when eight_pm.upto(midnight + 1.day).include?(current_time)
      return "Good Night"
    end

    return @greet
  end
end
