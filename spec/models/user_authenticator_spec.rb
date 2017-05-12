require "rails_helper"

describe UserAuthenticator do
  let(:user_params) { { email: "onemoreuser@example.com" } }
  let(:user_authenticator)  { UserAuthenticator.new(user_params) }

  it "can be instantiated" do
    expect(user_authenticator.class).to eq UserAuthenticator
    expect(user_authenticator.instance_variables).to eq [:@user_params]
  end

  describe "#find_or_create" do
    it "looks for a user with a given email or creates a new one" do
      expect(user_authenticator.find_or_create.class).to eq Mail::Message
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
