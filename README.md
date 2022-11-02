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
- has_many :consumers



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| address_id         | string     | null: false                    |
| period_id          | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :consumer



## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| address_id      | string     | null: false                    |
| address_number  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| consumer        | references | null: false, foreign_key: true |



### Association

- belongs_to :consumer

## consumers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer