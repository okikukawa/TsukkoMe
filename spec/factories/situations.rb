FactoryBot.define do
  factory :situation do
    title { "シチュエーションのタイトル1" }
  end
  factory :second_situation, class: Situation do
    title { "シチュエーションのタイトル2" }
  end
end
