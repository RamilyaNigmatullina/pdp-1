RSpec::Matchers.define :have_article do |article|
  match do |page|
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.short_text)
    expect(page).to have_content(article.author_full_name)
    expect(page).to have_content(article.time_created_in_words)
  end
end
