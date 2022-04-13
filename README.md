# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| password           | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| phone_num          | integer| null: false |
| email              | string | null: false |
| user_image         | string |             |
| introduction       | text   |             |

### Association

- belongs_to :sipping_address
- belongs_to :orders
- has_many :items
- has_many :comments
- has_many :messages


## itemsテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| name               | string     | null: false             |
| text               | text       | null: false             |
| price              | integer    | null: false             |
| category_id        | references | null: foreign_key: true |
| image              | string     | null: false             |
| user_id            | references | null: foreign_key: true |
| condition          | string     | null: false             |


### Association

- belongs_to :users
- belongs_to :categorys
- belongs_to :orgers
- has_many :comments
- has_many :messages

## sipping_addressテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| nickname           | string     | null: false             |
| first_name         | string     | null: false             |
| last_name          | string     | null: false             |
| phone_num          | integer    | null: false             |
| post_code          | integer    | null: false             |
| prefecture         | string     | null: false             |
| city               | string     | null: false             |
| address            | string     | null: false             |
| buillding_name     | string     |                         |
| user_id            | references | null: foreign_key: true |


### Association
- belongs_to :users

## commentsテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| text               | text       | null: false             |
| item_id            | references | null: foreign_key: true |
| user_id            | references | null: foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## messagesテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| text               | text       | null: false             |
| item_id            | references | null: foreign_key: true |
| user_id            | references | null: foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## categorysテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| name               | string     | null: false             |


### Association

- belongs_to :items

