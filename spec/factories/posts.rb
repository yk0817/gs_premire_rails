FactoryBot.define do
  factory :post do
    title { "testです。" }
    content { "0123456789" }
    trait :user_relation do
      user
    end
  end
end
