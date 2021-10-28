# README

現在修正中です。

## 作成動機
テックキャンプ通学以前から決めてのは読んだことのある本を具現化するコトでした。
そこで最近読んだ藤原麻里菜さん著書の「考える術」という本をアプリケーションにすることをテーマに取り組みました。
内容
第一章の「高速で新しいものを生み出す術」の内容を抜粋して下記2点にフォーカスしました。
・発想の基本は言葉から考える
・言葉と言葉を合体させて新しい造語を作りそこに役割を持たせる


## ペルソナ
本をよく読んだりするが、あまり変化を感じない人
本の内容は素晴らしいモノがすごく詰まっていると思うのですが、
その内容を実践や具現化する事がかなり難易度が高いのが原因であると仮説を立てました。
・20〜30代
・男性
・通勤時間で読書はする/NewsPicksやR25などで情報収集はするが日常に変化はない
・寝る前にYouTubeやTwitterを少し見て寝る
上記4点がペルソナのイメージです。

## エンティティ
投稿機能/お題機能/ユーザー登録機能/Twitter認証機能/Twitterシェア機能/タイマー機能

## アプリケーション名
 kocktail2                                      

## アプリケーション概要
発想力を鍛えるアプリケーション
・言葉を登録する
・登録した言葉がランダムで2つ繋げて表示される
・上記の造語の役割や意味付けを考える
・考えた内容をアウトプットする
・アウトプットした内容はTwitterにも投稿できる
・藤原麻里菜さんの"考える術"を実現するためのアプリケーション

## URL
https://kocktail2.herokuapp.com/

## テスト用アカウント
nickname:aaa
PW:aaa111

## 目指した課題解決
・発想力を鍛える表現力強化
・本で読んだ内容をアプリケーションに起こす
・言葉で整理する力をつける
・アウトプットを気軽にする練習をする           

## 実装した機能についての画像やGIFおよびその説明
### トップページ
https://i.gyazo.com/b12a7fe1b7caa91c48cb74735ec51cf2.gif
### Twitter認証
https://i.gyazo.com/bfb97143d1c721a1e506dc93903fa64f.gif
### 言葉登録ページ
https://i.gyazo.com/18e524c84b278d328076c1323775d390.gif
### ランダムお題ページ(上記で登録した言葉が表示されます)
https://i.gyazo.com/902e008f48929a412e1131e07ffd2e55.gif
### 投稿内容 Twitterにシェアする
https://i.gyazo.com/a4b5274b7b45fdb7a4f92a6064b128ca.gif


## user テーブル

|Column              |  Type        | Options                   |
|:-------------------|-------------:|:-------------------------:|
| nickname           | string       | null: false               |
| email              | string       | null: false , unique:true |
| password           | string       | null: false               |
| encrypted_password | string       | null: false               |

### Association
- has_many :post
- has_many :kotoba

## kotoba テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| word               | string       | null: false                   |
| decoration_id      | integer      |                               |
| password           | string       | null: false                   |
| encrypted_password | string       | null: false                   |
| user               | references   | null: false, foreign_key: true|

### Association
- has_many :post, through: :kotoba_post
- belongs_to :user



## post テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| text               | string       | null: false                   |
| kotoba_post        | references   | null: false, foreign_key: true|
| user               | references   | null: false, foreign_key: true|

### Association
- has_many :kotoba, through: :kotoba_post
- belongs_to :user


## kotoba_post テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| kotoba_1           | references   | null: false, foreign_key: true|
| kotoba_2           | references   | null: false, foreign_key: true|
| post               | references   | null: false, foreign_key: true|

### Association
- belongs_to :kotoba
- belongs_to :post