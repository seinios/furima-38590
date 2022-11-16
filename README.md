# users テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| nickname              | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| family_name           | string     | null: false                    |
| first_name            | string     | null: false                    |
| family_name_kana      | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birth                 | date       | null: false                    |


### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| address_id         | integer    | null: false                    |
| period_id          | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :buyer



## consumers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| address_id      | integer    | null: false                    |
| address_number  | string     | null: false                    |
| municipality    | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| buyer           | references | null: false, foreign_key: true |



### Association

- belongs_to :buyer

##　buyersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :consumer