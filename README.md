# TsukkoMe
URL：http://35.73.150.45/<br>
ヘッダーメニューの「かんたんログイン」よりユーザー登録不要で全ての機能をご利用いただけます。<br>

## 概要
TsukkoMe（ツッコミー）は、"たとえ"の上達をサポートするSNSアプリケーションです。<br>
<br>
お題に対して"例えツッコミ"という形で自分の例えを投稿したり、他のユーザーのツッコミを閲覧することで、"たとえ"のアウトプット・インプットを行うことができます。<br>
また、お題がランダムに表示される千本ノック機能を利用することで、さまざまなシチュエーションを瞬時にたとえるための瞬発力を鍛えることができます。<br>
<!-- TsukkoMeの主な特徴は以下です。<br>
  * 例えのインプット
    * ツッコミ一覧で他ユーザーの投稿を閲覧でき、例えのバリエーションを増やすことができます。
    * 同じお題に対して他ユーザーも投稿するため、どの表現が適切なのか、例えの精度を向上させることができます。
  * 例えのアウトプット
    * お題に対して例えツッコミを投稿することで、自分の例えをアウトプットできます。
    * お題ランダム表示機能（千本ノック機能）で、様々なお題に対してツッコむことで例えを定着させます。
<br> -->

## 開発の背景
面白いと言われているお笑い芸人や話がわかりやすいビジネスマン達の共通点の一つに、"たとえ"が上手いという特徴があります。
"たとえ"を巧みに使いこなす人たちは、自分が伝えたいことを聞き手にとって身近なものに例えることで、笑いを生み出したりわかりやすい話をしています。

自分としても面白い人になりたいという思いがあり、この"たとえ"をうまく使いこなせるようになるためには、引き出しの数を増やすことと瞬時にたとえることが必要だと考え、"例えツッコミ"という形でたとえを楽しくインプットとアウトプットができるアプリケーションを開発しました。<br>

## バージョン
* Ruby 2.6.5<br>
* Rails 5.2.4<br>

## 使用技術
* Bootstrap4
* PostgreSQL
* Nginx
* Puma
* AWS
* Capistrano3
* RSpec
* Docker Compose

## 機能一覧
**ユーザー関連**
- ユーザー機能、ログイン機能（device）

**お題関連**
* お題一覧表示
* お題投稿
* お題削除

**ツッコミ関連**
* ツッコミ投稿機能
  * ツッコミ投稿
  * ツッコミ編集
  * ツッコミ削除
* お気に入り機能
* ツッコミ検索（ransack）
* コメント機能
  * コメント投稿(Ajax)
  * コメント編集(Ajax)
  * コメント削除

**お題ランダム表示関連**
* お題ランダム表示
* ツッコミ表示

**全般**
* ページネーション(kaminari)
<br>

## カタログ設計
https://docs.google.com/spreadsheets/d/1jXx6tYbJC1tLKCVRveyW_lAtXAhkviH3ZYXz68gXaj0/edit#gid=1829836084
<br>

## テーブル定義
https://docs.google.com/spreadsheets/d/1gvFp6IEJHOyJkfTX039dh3mxPQv4OLuSdx15bLHKcgw/edit#gid=0
<br>

## 画面遷移図
https://docs.google.com/spreadsheets/d/1mzhu_-rIJsFz9g9WphY_5Jq9vtbqjq99VwNcJfI7JCU/edit#gid=0
<br>

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1PkiYkDD6HnzTGXp5kTyyHpQcwfRkdtvBbSseIAvtjzQ/edit#gid=0
<br>
