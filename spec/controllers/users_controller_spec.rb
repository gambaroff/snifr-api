require 'rails_helper'

describe UsersController do
  let(:valid_required_attributes) do
    {
      email: "user777@example.com",
    }
  end

  let(:valid_secondary_attributes) do
    {
      username: "user777",
      lonlat: 'Point(-71.1043443253471  42.3150676015829)',
    }
  end

  let(:invalid_attributes) do
    {
      email: ""
    }
  end

  describe "PUT update/:id" do
    context "with valid attributes" do
      it "updates an existing user user" do
        user = create(:user)

        put :update, id: user, username: "user777"
        user.reload

        expect(user[:username]).to eq "user777"
      end
    end
  end
end
