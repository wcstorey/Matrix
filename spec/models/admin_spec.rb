require 'rails_helper'

RSpec.describe Admin, :type => :model do

  it "is invalid without a username" do
    admin = Admin.new(username: nil)
    admin.valid?
    expect(admin.errors[:username]).to include("can't be blank")
  end
end
