require 'rails_helper'

describe LoginsController do
  it 'serves the login form' do
    get :new

    assert_response :success
  end

  describe "#create" do
    it 'creates an account' do
      email = "test@testing.com"

      user = lambda do
        post :create, user: { email: email }
      end

      expect(&user).to change(User, :count).by(1)
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to match "Login link sent to your email"
    end
  end
end
