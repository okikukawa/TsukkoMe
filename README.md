# README

# TukkoMe

## 概要
TsukkoMe（ツッコミー）は、"例え"の上達をサポートするツッコミ特化型SNSアプリです。<br>
<br>
ユーザーはお題に対して例えツッコミという形で自分の例えを投稿したり、他のユーザーのツッコミを閲覧することで様々な”例え”に触れ合うことができます。<br>
また、お題がランダムに表示される千本ノック機能では、次々と表示されるお題に対して例えツッコミを繰り返すことで、”例え”の定着を図ることができます。<br>
<br>
TsukkoMeの主な特徴は以下です。<br>
  * ツッコミフレーズのインプット
    * ツッコミ一覧で他ユーザーの投稿を閲覧でき、ツッコミのバリエーションを増やすことができます。
    * 同じお題に対して他ユーザーも投稿するため、どの表現が適切なのか、例えの精度を向上させます。
  * お題毎のアウトプット
    * お題に対してツッコミを投稿することで、自分の例えをアウトプットできます。
    * お題ランダム表示機能（千本ノック機能）で、様々なお題に対してツッコむことで例えを定着させます。
<br>

## 開発の背景
面白いと言われているお笑い芸人や話がわかりやすいビジネスマン達の共通点の一つに、"例え"が上手いという特徴があります。<br>
"例え"を巧みに使いこなす人たちは、自分が伝えたいことを聞き手にとって身近なものに例えることで、笑いを生み出したりわかりやすい話をしています。<br>
<br>
自分としても面白い人になりたいという思いがあり、この"例え"をうまく使いこなせるようになるためには、引き出しの数を増やすことと知識として定着させることが必要だと考え、インプットとアウトプットができるアプリケーションを開発しました。<br>
<br>

## コンセプト
例えツッコミや例え話の上達をサポートするツッコミ特化型SNSアプリ

## バージョン
Ruby 2.6.5<br>
Rails 5.2.4

## 機能一覧
* ユーザー登録機能
  * 新規登録、プロフィール編集機能
    * 名前、メールアドレス、パスワードは必須
  * ログイン、ログアウト機能

* お題
  * お題一覧表示
  * お題詳細
  * お題新規作成
  * お題削除

* ツッコミ
  * ツッコミ一覧表示
  * ツッコミ詳細
  * ツッコミ新規作成
  * ツッコミ編集
  * ツッコミ削除

* コメント
  * コメント作成機能
  * コメント編集機能
  * コメント削除機能

※各情報の編集・削除は投稿者のみ実行可能

* ナイスツッコミ（お気に入り）機能
* 投稿済みツッコミ、ナイスツッコミ表示機能
* 検索機能
* ジャンル（タグ）機能
* お題ランダム表示機能
* ページネーション機能

<br>
※以下スプレッドシート内の「シチュエーション」は「お題」と同義です

## カタログ設計
https://docs.google.com/spreadsheets/d/1jXx6tYbJC1tLKCVRveyW_lAtXAhkviH3ZYXz68gXaj0/edit#gid=1829836084

## テーブル定義
https://docs.google.com/spreadsheets/d/1gvFp6IEJHOyJkfTX039dh3mxPQv4OLuSdx15bLHKcgw/edit#gid=0

## 画面遷移図
https://docs.google.com/spreadsheets/d/1mzhu_-rIJsFz9g9WphY_5Jq9vtbqjq99VwNcJfI7JCU/edit#gid=0

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1PkiYkDD6HnzTGXp5kTyyHpQcwfRkdtvBbSseIAvtjzQ/edit#gid=0

## 使用予定Gem
* devise
* carrierwave
* mini_magick
* kaminari
* ransack

## 卒業課題要件
* 就業Termの技術
  * devise
    * ユーザー登録機能
  * コメント機能
* カリキュラム外からの技術
  * ransack
    * 検索機能
