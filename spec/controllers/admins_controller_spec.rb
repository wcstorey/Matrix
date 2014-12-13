require 'rails_helper'

RSpec.describe AdminsController, :type => :controller do

context "when a admin goes to login" do
    describe "admins#login" do
      it "loads a login page for an admin" do
        get :index
        expect(response).to be_success
      end
    end
  end
  end
