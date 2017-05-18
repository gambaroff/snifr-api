require "rails_helper"

describe UserAuthenticator do
  let(:user_params) { { email: "onemoreuser@example.com" } }
  let(:user_authenticator)  { UserAuthenticator.new(user_params) }

  describe "#call" do
    it "looks for a user with a given email or creates a new one" do
      expect(user_authenticator.call.class).to eq Mail::Message
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
