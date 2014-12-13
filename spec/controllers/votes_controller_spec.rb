require 'rails_helper'

describe VotesController do
  let(:test_category) {FactoryGirl.create :category}
  let(:test_post) {FactoryGirl.create :post}
  let(:test_user) {FactoryGirl.create :user}
  let(:test_vote) {test_post.votes.create :vote}




  describe "#create" do
    it "creates the vote if valid params" do
      expect {
        post :create,
        :category_id => test_category,
        :post_id => test_category.id,
        :user_id => test_user.id
      }.to change { Vote.count }.by(1)
    end
  end

end