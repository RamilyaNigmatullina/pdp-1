require "rails_helper"

feature "List articles" do
  let!(:articles) { create_list(:article, 2) }

  background do
    visit articles_path
  end

  scenario "Visitor lists articles" do
    article1, article2 = articles

    expect(page).to have_article(article1.decorate)
    expect(page).to have_article(article2.decorate)
  end
end
