class ArticlesPage
  include Capybara::DSL

  def visit_page
    visit "/articles"
  end

  def goto_article(name)
    visit "/articles"
    click_link name
  end

  def goto_article_direct(id)
    visit "/articles/#{id}"
  end

  def goto_article_nice(name)
    visit "/articles/#{nice}"
  end
end
