class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = UserAuthenticator.new(login_params).find_or_create
    redirect_to root_path, notice: 'Login link sent to your email'
  end

  private

    def login_params
      params.require(:user).permit(:email)
    end

end
