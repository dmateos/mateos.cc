require "rails_helper"

describe "visitor leaves a message" do
  let(:contact_page) { ContactPage.new }

  scenario "leaves a message via contact page" do
    contact_page.visit_page
    contact_page.leave_message("test", "test@test.com", "test", "test")
    expect(Message.first.subject).to eq("test")
    expect(page).to have_content("message has been submitted")
  end
end
