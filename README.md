# README

## Usersテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| nick_name             | string      | null: false                    |
| email                 | string      | null: false, unique: true      |
| encrypted_password    | string      | null: false                    |
| main_family_name      | string      | null: false                    |
| main_first_name       | string      | null: false                    |
| main_family_name_kana | string      | null: false                    |
| main_first_name_kana  | string      | null: false                    |
| birth_day             | date        | null: false                    |


### Association

 - has_many :items
 - has_many :addresses

## Itemsテーブル

| Column                  | Type        | Options                        |
| ----------------------- | ----------- | ------------------------------ |
| merchandise_name        | text        | null: false                    |
| merchandise_explanation | text        | null: false                    |
| merchandise_category    | string      | null: false                    |
| merchandise_condition   | string      | null: false                    |
| delivery_charge         | string      | null: false                    |
| shipping_from_area      | string      | null: false                    |
| time_to_ship            | string      | null: false                    |
| merchandise_price       | integer     | null: false                    |
| user                    | references  | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

## Addressesテーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| credit_card_number       | integer     | null: false                    |
| effective_month          | integer     | null: false                    |
| effective_year           | integer     | null: false                    |
| security_code            | integer     | null: false                    |
| receiving_postal_code    | integer     | null: false                    |
| receiving_area           | string      | null: false                    |
| receiving_municipalities | string      | null: false                    |
| receiving_house_number   | string      | null: false                    |
| receiving_building_name  | string      |                                |
| phone_number             | integer     | null: false                    |
| user                     | references  | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

 ## Ordersテーブル
| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| item                     | references  | null: false, foreign_key: true |
| address                | references  | null: false, foreign_key: true |

### Association
 - belongs_to :item
 - belongs_to :addresses