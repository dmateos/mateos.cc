class UsersPage
  include Capybara::DSL

  def visit_signup_page
    visit "users/new"
  end

  def visit_login_page
    visit "login"
  end

  def create_user(username, email, password, password_confirm = nil)
    password_confirm ||= password

    fill_in "Username", with: username
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Create user"
  end

  def sign_in(username, password)
    fill_in "Username", with: username
    fill_in "Password", with: password
    click_button "Log in"
  end

  def sign_out
    visit "logout"
  end
end
