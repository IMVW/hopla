class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show]

  def index
    @shifts = Shift.all
  end

  def show
  end

  def new
    @shift = Shift.new
    @department = Department.find(params[:department_id])
    @all_users_skills = User.all.pluck(:skills).flatten.uniq
    @all_users_skills_checkbox = @all_users_skills.map { |value| [value, value]}
  end

  def create
    @shift = Shift.new(shift_params)
    @department = Department.find(params[:department_id])
    @shift.department = @department
    raise
    # @shift.department = @department
    if @shift.save!
      redirect_to department_shifts_path(@department), notice: "New shift was added"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :skills)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
