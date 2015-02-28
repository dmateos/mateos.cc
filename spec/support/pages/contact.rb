class ContactPage
  include Capybara::DSL

  def visit_page
    visit "/contact"
  end

  def leave_message(name, email, subject, message)
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Subject", with: subject
    fill_in "Message", with: message
    click_button "Submit"
  end
end
