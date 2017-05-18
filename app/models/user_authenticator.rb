class UserAuthenticator < Service
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    user = User.find_or_create_by!(email: @user_params[:email]) do |u|
      u.username = "Edit me!"
    end

    user.update!(login_token: SecureRandom.urlsafe_base64,
                 login_token_valid_until: Time.now + 15.minutes)
    notify_user(user)
  end

  private

    def notify_user(user)
      LoginMailer.login_link(user).deliver
    end

end
