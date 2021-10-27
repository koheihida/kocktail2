# README

現在修正中です。

項目                                           

| アプリケーション名       kocktail2                                      
| アプリケーション概要     発想力を鍛えるアプリケーション
    ・言葉を登録する
    ・登録した言葉がランダムで2つ繋げて表示される
    ・上記の造語の役割や意味付けを考える
    ・考えた内容をアウトプットする
    ・アウトプットした内容はTwitterにも投稿できる
    ・藤原麻里菜さんの"考える術"を実現するためのアプリケーション
| URL                       https://kocktail2.herokuapp.com/
| テスト用アカウント        nickname:aaa
| テスト用アカウント        PW:aaa111
| 利用方法                  ログイン/ログアウト/言葉登録/投稿機能/投稿内容をシェア
| 目指した課題解決          発想力を鍛える、考える術、表現力強化、本で読んだ内容をアプリケーションに起こす
| 洗い出した要件            
| 実装した機能についての画像やGIFおよびその説明
| データベース設計                             |                                                |
| ローカルでの動作方法                         |                                                |

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