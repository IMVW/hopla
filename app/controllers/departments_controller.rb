class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:edit, :update, :destroy]

  def index
    @shift = Shift.new
    @departments = Department.all
    @hours = hours_in_day
    @days = days_in_year
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, notice: "New department created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @department.update(department_params)
    redirect_to departments_path
  end

  def destroy
    @department.destroy
    redirect_to departments_path, notice: "Department deleted"
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end

  def hours_in_day
    ['12:00am'] + (1..11).map {|h| "#{h}:00am"} + ['12:00pm'] + (1..11).map {|h| "#{h}:00pm"}
  end

  def days_in_year
    (Date.today..Date.today + 30.days).to_a
  end
end
