require "rails_helper"

feature "Create Article" do
  let(:user) { create :user }
  let(:article_attributes) { attributes_for(:article) }

  background do
    login_as user
    visit new_users_article_path
  end

  scenario "User creates article" do
    fill_form(:article, article_attributes)
    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")
  end
end
