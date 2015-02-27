require "rails_helper"

feature "visitor browses articles" do
  let!(:article) { FactoryGirl.create(:article, :published) }
  let!(:unpublished_article) { FactoryGirl.create(:article, :unpublished) }
  let(:article_page) { ArticlesPage.new }

  scenario "visits articles index page" do
    article_page.visit_page
    expect(page).to have_content(article.title)
  end

  scenario "clicks on an article and loads it" do
    article_page.visit_page
    article_page.goto_article(article.title)
    expect(page).to have_content(article.body)
  end

  scenario "goes to an article url directly via id" do
    article_page.goto_article_direct(article.id)
    expect(page).to have_content(article.body)
  end

  scenario "goes to an article url via nice name" do
    pending "implement this"
  end

  scenario "cant see unpublished articles" do
    article_page.visit_page
    expect(page).to have_no_content(unpublished_article.title)
  end

  scenario "cant goto unpublished article" do
    article_page.goto_article_direct(unpublished_article.id)
    expect(page).to have_no_content(unpublished_article.body)
  end
end

feature "admin browses articles" do
  let!(:article) { FactoryGirl.create(:article, :published) }
  let!(:unpublished_article) { FactoryGirl.create(:article, :unpublished) }
  let!(:user) { FactoryGirl.create(:user, admin: true) }
  let(:article_page) { ArticlesPage.new }
  let(:users_page) { UsersPage.new }

  before :each do
    users_page.visit_login_page
    users_page.sign_in(user.username, user.password)
  end

  scenario "can see unpublished articles" do
    article_page.visit_page
    expect(page).to have_content(unpublished_article.title)
  end

  scenario "clicks on an unpublished article and loads it" do
    article_page.visit_page
    article_page.goto_article(unpublished_article.title)
    expect(page).to have_content(unpublished_article.body)
  end

  scenario "goes to unpublished article directly" do
    article_page.goto_article_direct(unpublished_article.id)
    expect(page).to have_content(unpublished_article.body)
  end
end
