FactoryBot.define do
  factory :tsukkomi do
    phrase { 'ツッコミ1' }
  end
  factory :tsukkomi2, class: User do
    phrase { 'ツッコミ2' }
  end
end
