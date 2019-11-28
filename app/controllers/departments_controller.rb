class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:edit, :update, :destroy]

  def index
    @shift = Shift.new
    @departments = Department.all.order(:id)
    @hours = hours_in_day
    @days = days_in_year
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      respond_to do |format|
        format.html { redirect_to departments_path, notice: "New department created" }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
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
    redirect_to employees_path, notice: "Department deleted"
  end

  private



  def department_params
    params.require(:department).permit(:name, :color)
  end

  def set_department
    @department = Department.find(params[:id])
  end

  def hours_in_day
    hours = ['12:00 am'] + (1..11).map {|h| "#{h}:00 am"} + ['12:00 pm'] + (1..11).map {|h| "#{h}:00 pm"}
    hours_intervall = hours.select.each_with_index{|k,i| k if i%3 == 0}
  end

  def days_in_year
    (Date.today..Date.today + 30.days).to_a
  end
end
