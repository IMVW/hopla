class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy, :users_with_department]

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
    # binding.pry
    # @shift.department = @department
    if params[:shift][:start_time].split(" ")[0].split("-")[2] < params[:shift][:end_time].split(" ")[0].split("-")[2]
      split_shift
      if @shift_one.save && @shift_two.save
        redirect_to departments_path, notice: "New shift was added"
      else
        render :new
      end
    else
      @shift = Shift.new(shift_params)
      @shift.skills = params[:shift][:skills]
      if @shift.save
        redirect_to departments_path, notice: "New shift was added"
      else
        render :new
      end
    end
  end

  def edit
    show_skills
    # @users = user_name
    @shift = Shift.find(params[:id])
    @employees_department = @shift.department.users
    @users = user_selected_on_skills_minus_department
    @shift_skills = @shift.skills
    @users_all = User.all
  end

  def update
    @shift.skills = params[:shift][:skills]
    @shift.update(shift_params)
    # @department = Department.find(params[:department_id])
    redirect_to edit_shift_path(@shift)
  end

  def destroy
    @shift.destroy
    redirect_to departments_path, notice: "shift deleted"
  end

  private

  def split_shift
    @shift_one = Shift.new(start_time: params[:shift][:start_time], end_time: sh1_end_time, skills: params[:shift][:skills], department_id: params[:shift][:department_id], user_id: params[:shift][:user_id])
    @shift_one.save
    @shift_two = Shift.new(start_time: sh2_start_time, end_time: params[:shift][:end_time], skills: params[:shift][:skills], department_id: params[:shift][:department_id], user_id: params[:shift][:user_id])
    @shift_two.save
  end

  def sh1_end_time
    # params[:shift][:start_time].split(",")[0].split("-")[2]
    a = params[:shift]
    b = a[:start_time]
    c = b.split
    d = c[0]
    e = d.split("-")
    sh1_y = e[0].to_i
    sh1_m = e[1].to_i
    sh1_d = e[2].to_i

    sh1_end_time = DateTime.new(sh1_y, sh1_m, sh1_d).end_of_day
  end

  def sh2_start_time
    a = params[:shift]
    b = a[:end_time]
    c = b.split
    d = c[0]
    e = d.split("-")
    sh2_y = e[0].to_i
    sh2_m = e[1].to_i
    sh2_d = e[2].to_i

    sh2_start_time = DateTime.new(sh2_y, sh2_m, sh2_d).beginning_of_day
  end

  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :skills, :department_id, :user_id)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def show_skills
    @all_users_skills = User.all.pluck(:skills).flatten.uniq
    @all_users_skills_checkbox = @all_users_skills.map { |value| [value, value] }
  end

  def users_with_department
    users_that_match = []
    User.all.each { |user| (users_that_match << user) if (user.departments.size == 1) && !(user.departments[0].id == @shift.department.id)}
    users_that_match.uniq
  end

  def user_selected_on_skills_minus_department
    @shift = Shift.find(params[:id])
    users = users_with_department
    @shift_skills = @shift.skills
    @skilled_employees = []
    if !@shift_skills.nil?
      @shift_skills.each do |skill|
        unless skill == ""
          users.each do |user|
            @skilled_employees << user if user.skills.include?(skill)
          end
        end
      end
    end
    return @skilled_employees.uniq!
  end

end


      # User.all.pluck(:skills).flatten.uniq


  # def user_name
  #   users = User.all
  #   @a_user = []
  #   users.each do |user|
  #     @a_user << [user.first_name, user.id]
  #   end
  #   return @a_user
  # end
