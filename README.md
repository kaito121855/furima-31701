# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  | 
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    | 
| status_id   | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

##  orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| product       | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :residence
- belongs_to :product
- belongs_to :user

## residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    | 
| address       | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order