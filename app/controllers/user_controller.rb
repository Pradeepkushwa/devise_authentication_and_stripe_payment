class UserController < ApplicationController
  def create
   @user = User.new(user_params)

   if @user.save
    UserMailer.welcome_email(@user).deliver_now
    redirect_to @user, notice: 'User was successfully created.'
  else
    render :new
  end
end

private

def user_params
  
end
end
