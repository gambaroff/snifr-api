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

  describe "GET edit" do
    it 'serves the edit form' do
      user = User.new(email: "test@test.com", id: 4)
      current_user = user

      user.edit

    end
  end
  describe "PUT update" do
    context "with valid attributes" do
      it "updates an existing user user" do
        user = User.new(valid_required_attributes)
        expect(user[:username]).to be_nil

        user.update(valid_secondary_attributes)

        expect(user[:username]).to eq "user777"
        expect(user[:lonlat].class).to eq RGeo::Geographic::SphericalPointImpl
      end
    end
  end
end
