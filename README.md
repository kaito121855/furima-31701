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
- has_many :purchases

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    | 
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one :purchases
- belongs_to :user

##  purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| product       | references | null: false, foreign_key: true |
| residence     | references | null: false, foreign_key: true |

### Association

- has_one :residences
- belong_to :product
- belong_to :user

## residences テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ | 
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| municipality | string     | null: false                    | 
| address      | string     | null: false                    |
| building     | string     |                                |
| telephone    | integer    | null: false                    |

### Association

- belongs_to :residence