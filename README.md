# テーブル設計

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false ,unique:true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many :orders
- has_many :items
- has_many :comments
- has_many :messages


## itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| info               | text       | null: false                   |
| price              | integer    | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| pay_for_sipping_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| shipping_day_id    | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- has_one  :order
- has_many :comments
- has_many :messages

## shipping_addressテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| address            | string     | null: false                   |
| buillding_name     | string     |                               |
| phone_number       | string     | null:false                    |
| order              | references | null: false,foreign_key: true |


### Association
- has_one :order

## commentsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| text               | text       | null: false                   |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## messagesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| text               | text       | null: false                   |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address