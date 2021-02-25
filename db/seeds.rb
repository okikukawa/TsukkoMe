# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create!(
  name: "ユーザー1",
  email: "test1@test.com",
  password: "password",
  profile: "よろしくおねがいします。"
)

15.times do |n|
  @user.situations.create!(
    title: "お題#{n + 1}"
  )
end

@situation = @user.situations.create!(
  title: "このお題にツッコミが紐づく"
)

15.times do |n|
  @situation.tsukkomis.create!(
    phrase: "ツッコミ#{n + 1}",
    user_id: 1
  )
end

@tsukkomi = @situation.tsukkomis.create!(
  phrase: "このツッコミにコメントが紐づく",
  user_id: 1
)

15.times do |n|
  @tsukkomi.comments.create!(
    content: "コメント#{n + 1}",
    user_id: 1
  )
end
