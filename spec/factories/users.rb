FactoryGirl.define do
  factory :user do |f|
    f.username "test-user"
    f.email "test@test-email.com"
    f.password "test-password"
    trait(:admin) { admin true }
    trait(:not_admin) { admin false }
  end
end
