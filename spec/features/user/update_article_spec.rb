require "rails_helper"

feature "Update  Article" do
  let(:user) { create :user }
  let(:article) { create :article, user: user }
  let(:article_attributes) { attributes_for(:article) }

  background do
    login_as user
  end

  scenario "User updates article" do
    visit edit_users_article_path(article)

    fill_form(:article, article_attributes)
    click_button "Update Article"

    expect(page).to have_content("Article was successfully updated.")
  end

  scenario "User updates other user's article" do
    visit edit_users_article_path(create(:article))

    expect(page).not_to have_button "Update Article"
  end
end
