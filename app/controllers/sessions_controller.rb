class SessionsController < ApplicationsController
  # This is the action triggered by login link
  def create
    # Don't sign in user with expired token
    user = User.where(login_token: params[:token])
               .where('login_token_valid_until > ?', Time.now).first
    if user
      # Nullify login token so it can't be reused
      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)
      self.current_user = user
      redirect_to root_path, notice: "Signed-in successfully"
    else
      redirect_to root_path, alert: "Invalid or expired login link"
    end
  end

  def destroy
    self.current_user = NullUser.new
    redirect_to root_path, notice: "Successfully signed out"
  end
end
