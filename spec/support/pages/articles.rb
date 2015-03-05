class ArticlesPage
  include Capybara::DSL

  def visit_page
    visit "/articles"
  end

  def goto_article(name)
    visit "/articles"
    first(:link, name).click
  end

  def goto_article_direct(id)
    visit "/articles/#{id}"
  end

  def goto_article_nice(name)
    visit "/articles/#{nice}"
  end
  
  def new_article(title, body, published = true)
    visit "/articles/new"
    fill_in "Title", with: title
    fill_in "Body", with: body
    check "Published"
    click_button "Create Article"
  end
end
