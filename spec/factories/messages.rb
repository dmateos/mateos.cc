FactoryGirl.define do
  factory :message do |f|
    f.name "test contacter"
    f.email "test@test-email.com"
    f.subject "test subject"
    f.message "test message"
  end
end
