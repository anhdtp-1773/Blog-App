FactoryBot.define do
  factory :comment do
    user { nil }
    entry { nil }
    content { "MyText" }
  end
end
