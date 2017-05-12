require 'rails_helper'

describe User, type: :model do
  subject(:user) { build(:user) }

  describe "Validations" do
    it "requires email address" do
      user = build(:user, email: "")

      expect(user).to_not be_valid
    end

    it "doesn't yet require point data" do
      user = build(:user, lonlat: " ")

      expect(user).to be_valid
    end
  end
end
