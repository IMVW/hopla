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
    @user = User.new
    @departments = Department.all
    # show form to Create a new user
  end

  def create
    new_params = params[:user]
    @departments = Department.all
    @user = User.new(email: new_params[:email], first_name: new_params[:first_name], last_name: new_params[:last_name], password:"password", password_confirmation: "password")
    if @user.save
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
    show_skills
    @departments = Department.all

    # see who list employees
    # edit the employee that is selected
  end

  def update
    # department = Department.find(params[:user][:department_id].to_i)
    # DepartmentsUser.where(user: @user).destroy_all
    # DepartmentsUser.create!(user: @user, department: department)

    # @user.update(user_params)
    # redirect_to employee_path
    # flash[:notice] = "Employee updated"

    @departments = Department.all
    @user = User.find(params[:id])
    if @user.update(no_devise_user_params)
      department = Department.find(params[:user][:department_id].to_i)
      # DepartmentsUser.where(user_id: @user.id).destroy_all
      # @user.departments_users.destroy_all
      # DepartmentsUser.find(user: @user, department: department).destroy_all
      @user.departments.destroy_all
      DepartmentsUser.create!(user: @user, department: department)
      redirect_to employees_path
      flash[:notice] = "Employee updated"
    else
      render :new
      flash[:alert] = "Something went wrong, please try again"
    end
    # update and save employee
  end

  def destroy
    # delete employee
    @user.destroy
    redirect_to employee_path, notice: "user deleted"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def show_skills
    @all_users_skills = User.all.pluck(:skills).flatten.uniq
    @all_users_skills_checkbox = @all_users_skills.map { |value| [value, value] }
  end

  def no_devise_user_params
    {
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      manager: params[:user][:manager],
      skills: params[:user][:skills].reject { |c| c.empty? },
      phone_number: params[:user][:phone_number],
      birthday: params[:user][:birthday],
      photo: params[:user][:photo],
      photo_cache: params[:user][:photo_cache]
    }
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :manager, :skills, :phone_number, :birthday, :photo, :photo_cache)
  end
end
