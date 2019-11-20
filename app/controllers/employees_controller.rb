class EmployeesController < ApplicationController

  def index
    # Show a list of all the employees
    @users = User.all
    # @department = Department.find(params[:department_id])
  end

  def show
    # Show a specific employee
  end

  def new
    @employees = User.new
    # show form to Create a new employee
  end

  def create
    new_params = params[:employees]
    @user = User.new(email: new_params[:email], first_name: new_params[:first_name], last_name: new_params[:last_name], password:"password", password_confirmation: "password")
    if @user.save
      redirect_to employees_path
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

end
