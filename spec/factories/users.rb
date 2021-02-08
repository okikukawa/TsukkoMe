FactoryBot.define do
  factory :user do
    name { 'ユーザー1' }
    email { 'user1@test.com' }
    password { 'password' }
  end
  factory :user2, class: User do
    name { 'ユーザー2' }
    email { 'user2@test.com' }
    password { 'password' }
  end
end
