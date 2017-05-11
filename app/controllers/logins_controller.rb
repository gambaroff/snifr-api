class LoginsController < ApplicationController
  def new 
    @user = User.new
  end

  
  # This is triggered by the login form
  # if we don't find user by given email we create new one
  def create
    user = User.find_or_create_by!(email: params[:user][:email]) do |u|
      u.username = "Edit me!"
    end
    # Here we set unique login token, which is valid only for the next
    # 15 minutes
    user.update!(login_token: SecureRandom.urlsafe_base64,
                 login_token_valid_until: Time.now + 15.minutes)

    LoginMailer.login_link(user).deliver

    redirect_to root_path, notice: 'Login link sent to your email'
  end
end
