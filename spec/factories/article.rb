FactoryGirl.define do
  factory :article do |f|
    f.sequence(:title) { |n| "Test article title #{n}" }
    f.sequence(:body) { |n| "Test article body #{n}" }
    trait(:published) { published true }
    trait(:unpublished) { published false }
  end
end
