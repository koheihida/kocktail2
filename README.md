# README

# アプリケーション名
Kocktail(カクテル)

# URL
https://kocktail2.herokuapp.com/

テスト用アカウント\
nickname:aaa\
パスワード:aaa111 

# 実装環境
Ruby：2.6.5 \
Ruby on Rails：6.0.4.1

# デプロイ
Heroku

# 実装期間
2021年10月13日〜11月17日

[![Image from Gyazo](https://i.gyazo.com/c7c007f1bdcc1c5a76a2c6007adda08d.png)](https://gyazo.com/c7c007f1bdcc1c5a76a2c6007adda08d)

## ペルソナ
本をよく読んだりするが、あまり変化を感じない人
本の内容は素晴らしいモノがすごく詰まっていると思うのですが、
その内容を実践や具現化する事がかなり難易度が高いのが原因であると仮説を立てました。
・20〜30代
・男性
・通勤時間で読書はする/NewsPicksやR25などで情報収集はするが日常に変化はない
・寝る前にYouTubeやTwitterを少し見て寝る

## エンティティ
ソーシャルログイン機能/お題登録機能/投稿機能/投稿をTwitterにシェア/検索機能/投稿削除機能/お題削除機能

## アプリケーション概要
発想力を鍛えるアプリケーション
・言葉を登録する
・登録した言葉がランダムで2つ繋げて表示される
・上記の造語の役割や意味付けを考える
・考えた内容をアウトプットする
・アウトプットした内容はTwitterにも投稿できる
・藤原麻里菜さんの"考える術"を実現するためのアプリケーション

## 目指した課題解決
・発想力を鍛える表現力強化
・本で読んだ内容をアプリケーションに起こす
・言葉で整理する力をつける
・アウトプットを気軽にする練習をする           

## 実装した機能についての画像やGIFおよびその説明
-### トップページ(メインjQuery)
[![Image from Gyazo](https://i.gyazo.com/2f1493b082798a46f8b5c502496ca52c.gif)](https://gyazo.com/2f1493b082798a46f8b5c502496ca52c)
### indexページ全体
[![Image from Gyazo](https://i.gyazo.com/d77aa278fbf7aa7368859c56497beabb.gif)](https://gyazo.com/d77aa278fbf7aa7368859c56497beabb)
-### Twitter認証
[![Image from Gyazo](https://i.gyazo.com/c5737c1a3ffd7ae72f3a8dd07fd5c6b3.gif)](https://gyazo.com/c5737c1a3ffd7ae72f3a8dd07fd5c6b3)
### 言葉登録ページ
[![Image from Gyazo](https://i.gyazo.com/487a32025aa2273663c9014b9e6ed96c.gif)](https://gyazo.com/487a32025aa2273663c9014b9e6ed96c)
### ランダムお題ページ(上記で登録した言葉がランダムで表示されます)
[![Image from Gyazo](https://i.gyazo.com/0c2ea761da0635128e64da9a7441412e.gif)](https://gyazo.com/0c2ea761da0635128e64da9a7441412e)
### 上記のお題はtext_areaに自動挿入されます
[![Image from Gyazo](https://i.gyazo.com/7b4bc0ee608cbc898d151c48e64f27fb.gif)](https://gyazo.com/7b4bc0ee608cbc898d151c48e64f27fb)
### タイマー機能
[![Image from Gyazo](https://i.gyazo.com/b5cf9cc5c096764fcef5fb9e858e708b.gif)](https://gyazo.com/b5cf9cc5c096764fcef5fb9e858e708b)
### 投稿内容 Twitterにシェアする
[![Image from Gyazo](https://i.gyazo.com/a04c53d105c71daecbb96dc6a3116875.gif)](https://gyazo.com/a04c53d105c71daecbb96dc6a3116875)


## user テーブル

|Column              |  Type        | Options                   |
|:-------------------|-------------:|:-------------------------:|
| nickname           | string       | null: false               |
| email              | string       | null: false , unique:true |
| password           | string       | null: false               |
| encrypted_password | string       | null: false               |

### Association
- has_many :post
- has_many :keyword

## kotoba テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| word               | string       | null: false                   |
| decoration_id      | integer      |                               |
| password           | string       | null: false                   |
| encrypted_password | string       | null: false                   |
| user               | references   | null: false, foreign_key: true|

### Association
- has_many :post, through: :keyword_post
- belongs_to :user

## post テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| text               | string       | null: false                   |
| keyword_post       | references   | null: false, foreign_key: true|
| user               | references   | null: false, foreign_key: true|

### Association
- has_many :keyword, through: :keyword_post
- belongs_to :user


## keyword_post テーブル
|Column              |  Type        | Options                       |
|:-------------------|-------------:|:-----------------------------:|
| keyword_1          | references   | null: false, foreign_key: true|
| keyword_2          | references   | null: false, foreign_key: true|
| post               | references   | null: false, foreign_key: true|

### Association
- belongs_to :keyword
- belongs_to :post