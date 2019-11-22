class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to My Awesome Webapp')
  end

  def create_confirmation
    @employee = params[:employee]
    mail(
      to: @employee.user.email,
      subject: "Employee #{@employee.name} created!"
    )
  end
end
