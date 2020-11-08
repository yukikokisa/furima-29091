
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |   
| fast_name      | string | null: false |
| last_name_kana | string | null: false |
| fast_name_kana | string | null: false |
| birth_date     | date   | null: false |

### Association

- has_many :items
- has_one :order
- has_one :address

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| postage_player_id | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| price             | string     | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| price       | integer    | null: false                    |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| order          | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |

### Association
- belongs_to : user
- belongs_to : order