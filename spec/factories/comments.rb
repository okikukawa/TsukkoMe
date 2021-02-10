FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    tsukkomi { nil }
  end
end
