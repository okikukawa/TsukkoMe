# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create!(
  name: "ツッコミ先生",
  email: "test@test.com",
  password: "password",
  profile: "よろしくおねがいします。"
)

@situation = @user.situations.create(title: "めちゃくちゃ落ち着く")
@situation = @situation.tsukkomis.create(phrase: "飛行機で飲むコンソメスープくらい落ち着く", user_id: 1)

@situation = @user.situations.create(title: "怒らせてはいけない")
@situation = @situation.tsukkomis.create(phrase: "半沢直樹くらい怒らせてはいけない", user_id: 1)

@situation = @user.situations.create(title: "一番眠たい")
@situation = @situation.tsukkomis.create(phrase: "水泳の授業の後の国語の授業くらい眠たい", user_id: 1)

@situation = @user.situations.create(title: "めちゃくちゃ優しい")
@situation = @situation.tsukkomis.create(phrase: "映画版のジャイアンくらい優しい", user_id: 1)

@situation = @user.situations.create(title: "一言も喋らない")
@situation = @situation.tsukkomis.create(phrase: "カニ食べてる？", user_id: 1)

@situation = @user.situations.create(title: "すぐ時間が経つ")
@situation = @situation.tsukkomis.create(phrase: "USJおるときくらいすぐ時間が経つ", user_id: 1)

@situation = @user.situations.create(title: "一番信用できない")
@situation = @situation.tsukkomis.create(phrase: "毎日投稿始めますって言うyoutuberくらい信用できない", user_id: 1)

@situation = @user.situations.create(title: "たくさんかき集める人に対して")
@situation = @situation.tsukkomis.create(phrase: "甲子園の砂くらいかき集めるやん", user_id: 1)

@situation = @user.situations.create(title: "ややこしい")
@situation = @situation.tsukkomis.create(phrase: "ノーバン始球式くらいややこしい", user_id: 1)

@situation = @user.situations.create(title: "直角")
@situation = @situation.tsukkomis.create(phrase: "エジプトくらい直角", user_id: 1)

@situation = @user.situations.create(title: "おいしい")
@situation = @situation.tsukkomis.create(phrase: "風邪明けの雑炊くらいおいしい", user_id: 1)
