# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false | 
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| item_name   | text       | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    | 
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | int        | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :product_purchases
- has_one :purchases, through :product_purchases 
- belongs_to :user

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| purchase_date | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :product_purchases
- has_many :purchase_residences
- has_one :products, through :product_purchases
- has_one :residences, through :purchase_residences
- belongs_to :user

## product_purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| product       | references | null: false, foreign_key: true |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :purchase

## residences テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ | 
| postal_code  | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    | 
| address      | string     | null: false                    |
| building     | string     |                                |
| telephone    | integer    | null: false                    |

### Association

- has_many :purchase_residences
- has_one :residences, through :purchase_residences 

## purchase_residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| purchase      | references | null: false, foreign_key: true |
| residence     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :residence