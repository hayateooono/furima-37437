# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique:true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | integer| null: false |
| user_image         | string |             |
| introduction       | text   |             |

### Association

- belongs_to :sipping_address
- has_many :orders
- has_many :items
- has_many :comments
- has_many :messages


## itemsテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| name               | string     | null: false             |
| text               | text       | null: false             |
| price              | integer    | null: false             |
| category_id        | integer    | null: false             |
| condition_id       | integer    | null: false             |
| pay_for_sipping_id | integer    | null: false             |
| Shipment source_id | integer    | null: false             |
| day_id             | integer    | null: false             |
| user               | references | null: foreign_key: true |


### Association

- belongs_to :users
- belongs_to :orders
- has_many :comments
- has_many :messages

## sipping_addressテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| post_code          | integer    | null: false             |
| prefecture         | string     | null: false             |
| city               | string     | null: false             |
| address            | string     | null: false             |
| buillding_name     | string     |                         |
| phone_number       | integer    | null:false              |
| user               | references | null: foreign_key: true |
| order              | references | null: foreign_key: true |


### Association
- belongs_to :users
- belongs_to :orders

## commentsテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| text               | text       | null: false             |
| item               | references | null: foreign_key: true |
| user               | references | null: foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## messagesテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| text               | text       | null: false             |
| item               | references | null: foreign_key: true |
| user               | references | null: foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## ordersテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| item               | references | null: foreign_key: true |
| user               | references | null: foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :sipping_address