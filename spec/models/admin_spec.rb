require 'rails_helper'

RSpec.describe Admin, :type => :model do

  context "when a admin goes to signup" do
    it "is invalid without a username" do
      admin = Admin.new(username: nil)
      admin.valid?
      expect(admin.errors[:username]).to include("can't be blank")
    end
  end

  context "when a admin goes to signup" do
    it "is invalid without an email" do
      admin = Admin.new(email: nil)
      admin.valid?
      expect(admin.errors[:email]).to include("can't be blank")
    end
  end

  context "when a admin goes to signup" do
    it "is invalid without an password" do
      admin = Admin.new(password: nil)
      admin.valid?
      expect(admin.errors[:password]).to include("can't be blank")
    end
  end




end
