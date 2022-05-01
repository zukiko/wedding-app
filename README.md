# アプリケーション名
Weddingpamph(ウェディングパンフ)

# アプリケーションの概要

# URL

# テスト用アカウント

# 利用方法

# アプリケーションを作成した背景

# 洗い出した要件

# 実装機能

# ER図

# 画面遷移図

#  テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | -------------------------|
| attendance         | string  | null: false              |
| bride_groom        | string  | null: false              |
| name               | string  | null: false              |
| name_kana          | string  | null: false              |
| postal_code        | string  | null: false              |
| prefecture_code    | string  | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  |                          |
| allergy            | text    |                          |
| bus                | text    |                          |
| email              | string  | null: false,unique: true |
| admin              | boolean | default: false           |


### Association

- has_one :seating_list
- has_many :photos

## seatinglists テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| table            | string     | null: false                    |
| seat_number      | integer    | null: false                    |
| message          | text       |                                |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## photos テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| text       | text       | null: false                    |

### Association

- belongs_to :user