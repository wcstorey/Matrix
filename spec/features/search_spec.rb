require 'rails_helper'

feature "Search functionality" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:post) { FactoryGirl.create(
      :post,
      category: category,
      content: "test"
    )}

  scenario "user logged in search for test" do
    sign_in_as! user
    click_link category.name
    find(:xpath, "//input[@id='search']").set post.content
    # fill_in "Search", with: "test"
    click_button "Search"
    expect(page).to have_content(post.title)
  end
end
