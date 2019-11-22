class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  def index
    @shifts = Shift.all
  end

  def show
  end

  def new
    @shift = Shift.new
    @department = Department.find(params[:department_id])
    show_skills
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.skills = params[:shift][:skills]
    # @shift.department = @department
    if @shift.save
      redirect_to departments_path, notice: "New shift was added"
    else
      render :new
    end
  end

  def edit
    show_skills
  end

  def update
    @shift.skills = params[:shift][:skills]
    @shift.update(shift_params)
    # @department = Department.find(params[:department_id])
    redirect_to departments_path
  end

  def destroy
    @shift.destroy
    redirect_to departments_path, notice: "shift deleted"
  end

  private

  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :skills, :department_id)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def show_skills
    @all_users_skills = User.all.pluck(:skills).flatten.uniq
    @all_users_skills_checkbox = @all_users_skills.map { |value| [value, value] }
  end
end
