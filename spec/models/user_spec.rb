require 'rails_helper'
require 'spec_helper'

describe User do

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :username }
    it { should_not allow_value("test@test").for(:email) } #can't use validat_format_of test here
  end

  context "associations" do
    it {  should have_many :posts }
    it {  should have_many :votes }

  end

end
