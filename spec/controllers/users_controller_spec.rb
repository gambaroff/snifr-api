require 'rails_helper'

describe UsersController do
  let(:valid_attributes) do
    {
      username: "user777",
      email: "user777@example.com",
      lonlat: 'Point(-71.1043443253471  42.3150676015829)',
    }
  end

  let(:invalid_attributes) do
    {
      email: ""
    }
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        user = lambda do
          post :create, user: valid_attributes
        end
        expect(&user).to change(User, :count).by(1)
      end
    end

    context "with invalid params" do
      it "redirects to a new user" do
        post :create, user: invalid_attributes

        expect(response).to redirect_to new_user_path
      end
    end
  end
end
