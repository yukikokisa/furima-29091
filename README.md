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
- has_many :buyers

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| image          | string     | null: false                    |
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| postage_player | string     | null: false                    |
| shipping_area  | string     | null: false                    |
| shipping_date  | string     | null: false                    |
| price          | string     | null: false                    |
| buyer          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buyer

## buyer テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| credit-card | references | null: false, foreign_key: true |
| adress      | references | null: false, foreign_key: true |


### Association

has_many :users
belongs_to :items
has_one :credit-cards
has_one :adresses


## credit-cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer         | references | null: false, foreign_key: true |
| card_number   | string     | null: false                    |
| card_year     | string     | null: false                    |
| card_month    | string     | null: false                    |
| security_code | string     | null: false                    |

### Association

- belongs_to : buyer

## adresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buyer        | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| apartment    | string     |                                 |
| phone_number | string     | null: false                    |

### Association

- belongs_to : buyer