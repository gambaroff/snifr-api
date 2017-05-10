class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful save
    else
      redirect_to new_user_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :username, :lonlat)
  end
end
