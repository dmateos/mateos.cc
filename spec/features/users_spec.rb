require "rails_helper"

feature "visitor signs up" do
  let(:users_page) { UsersPage.new }

  scenario "creates a new valid user" do
    users_page.visit_signup_page 
    users_page.create_user("test-user", "test@test-email.com", "test-password")
    expect(User.where(username: "test-user").first).to_not eq(nil)
    expect(page).to have_content("new user created")
  end

  scenario "attempts to create a user that already exists" do
    users_page.visit_signup_page
    users_page.create_user("test-user", "test@test-email.com", "test-password")
    users_page.visit_signup_page
    users_page.create_user("test-user", "test@test-email.com", "test-password")
    expect(page).to have_content("user already exists")
  end
end

feature "visitor signs in" do
  let!(:user) { FactoryGirl.create(:user, admin: false) }
  let(:users_page) { UsersPage.new }

  scenario "signs in with a valid user" do
    users_page.visit_login_page
    users_page.sign_in(user.username, user.password)
    expect(page).to have_content("authenticated")
  end

  scenario "attempts sign in with a incorrect password" do
    users_page.visit_login_page
    users_page.sign_in(user.username, "invalid-password")
    expect(page).to have_content("could not authenticate")
  end

  scenario "goes to login page if already logged in" do
    users_page.visit_login_page
    users_page.sign_in(user.username, "test-password")
    users_page.visit_login_page
    expect(page).to have_content("already authenticated")
  end

  scenario "goes to signup page if already logged in" do 
    users_page.visit_login_page
    users_page.sign_in(user.username, "test-password")
    users_page.visit_signup_page
    expect(page).to have_content("already authenticated")
  end
end

feature "user signs out" do
  let!(:user) { FactoryGirl.create(:user, admin: false) }
  let(:users_page) { UsersPage.new }

  scenario "signs out via signout link" do
    users_page.visit_login_page
    users_page.sign_in(user.username, user.password)
    users_page.sign_out
    expect(page).to have_content("unauthenticated")
  end
end
