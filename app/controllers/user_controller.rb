class UserController < ApplicationController
  def create
     @user = User.new(user_params)

    if @user.save
      # Send welcome email after successful user creation
      UserMailer.welcome_email(@user).deliver_now

      # Redirect or perform other actions upon successful user creation
      redirect_to @user, notice: 'User was successfully created.'
    else
      # Handle validation errors or other issues
      render :new
    end
  end

  private

  def user_params
    # Define your strong parameters for user creation
  
  end
end
