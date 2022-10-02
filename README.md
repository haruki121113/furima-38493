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

 - has_many :orders
 - has_many :items

## Itemsテーブル

| Column                     | Type        | Options                        |
| -------------------------- | ----------- | ------------------------------ |
| merchandise_name           | string      | null: false                    |
| merchandise_explanation    | text        | null: false                    |
| merchandise_category_id    | integer     | null: false                    |
| merchandise_condition_id   | integer     | null: false                    |
| delivery_charge_id         | integer     | null: false                    |
| area_id                    | integer     | null: false                    |
| time_to_ship_id            | integer     | null: false                    |
| merchandise_price          | integer     | null: false                    |
| user                       | references  | null: false, foreign_key: true |

### Association

 - has_one :order
 - belongs_to :user

## Addressesテーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| receiving_postal_code    | string      | null: false                    |
| area_id                  | integer     | null: false                    |
| receiving_municipalities | string      | null: false                    |
| receiving_house_number   | string      | null: false                    |
| receiving_building_name  | string      |                                |
| phone_number             | string      | null: false                    |
| order                    | references  | null: false, foreign_key: true |

### Association

 - belongs_to :order

 ## Ordersテーブル
| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| item                     | references  | null: false, foreign_key: true |
| user                     | references  | null: false, foreign_key: true |

### Association

 - belongs_to :item
 - has_one :address
 - belongs_to :user