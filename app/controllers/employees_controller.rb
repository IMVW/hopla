class EmployeesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    # Show a list of all the employees
    @users = User.all

    # @department = Department.find(params[:department_id])
  end

  def show
    # Show a specific employee
  end

  def new
    @employee = User.new
    @departments = Department.all
    # show form to Create a new employee
  end

  def create
    new_params = params[:user]
        @departments = Department.all
    @employee = User.new(email: new_params[:email], first_name: new_params[:first_name], last_name: new_params[:last_name], password:"password", password_confirmation: "password")
    if @employee.save
      department = Department.find(params[:user][:department_id].to_i)
      DepartmentsUser.create!(user: @user, department: department)
      redirect_to employees_path
      flash[:notice] = "New employee created"
    else
      render :new
      flash[:alert] = "Something went wrong, please try again"
    end
    # Create and save a new employee
  end

  def edit
    # see who list employees
    # edit the employee that is selected
  end

  def update
    # update and save employee
  end

  def destroy
    # delete employee
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
