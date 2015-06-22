class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url, notice: "Sign up!"
  	else
  		render "new"
  	end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
