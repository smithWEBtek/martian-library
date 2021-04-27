FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
  end

  factory :item do
    sequence(:title) { |n| "item-#{n}" }
    sequence(:description) { |n| "At this point, we have been to Mars #{n} times." }
    user
  end
end
