require "rails_helper"

RSpec.describe LoginMailer, type: :mailer do
  describe "login_link" do
    let(:user) { User.new(email: "awesomeuser@example.com") }
    let(:mail) { LoginMailer.login_link(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq([user[:email]])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Login")
    end
  end

end
