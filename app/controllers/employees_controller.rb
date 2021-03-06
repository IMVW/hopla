class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order(:first_name)
    @departments = Department.all.order(:id)
    @department = Department.new
  end

  def new
    show_skills
    @user = User.new
    @departments = Department.all
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
  end

  def edit
    show_skills
    @departments = Department.all
    @department = @user.departments.first
  end

  def update
    @departments = Department.all
    @user = User.find(params[:id])
    @department = @user.departments.first
    if @user.update(no_devise_user_params)
      @user.departments.destroy_all
      unless params[:user][:department_id].empty?
        department = Department.find(params[:user][:department_id].to_i)
        DepartmentsUser.create!(user: @user, department: department)
      end
      redirect_to employees_path
      flash[:notice] = "Employee updated"
    else
      render :new
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  def destroy
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
