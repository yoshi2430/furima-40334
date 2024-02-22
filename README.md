##　テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null:false                |
| name_kana          | string | null:false                |
| birthday           |  date  | null:false                |

### Association

has_many :items
has_many :purchases

## itemsテーブル

| Column              | Type       | Options                      |
| ------------------  | ------     | -----------                  |
| name                | string     | null: false                  |
| description         | text       | null: false                  |
| category            | string     | null: false,default:'_ _ _'  |
| condition           | string     | null:false,default:'_ _ _'   |
| shipping_fee_burden | string     | null:false,default:'_ _ _'   |
| shipping_region     | string     | null:false,default:'_ _ _'   |
| shipping_days       | string     | null:false,default:'_ _ _'   |
| price               | integer    | null:false                   |
| user                | references | null:false,foreign_key: true |


### Association

has_one :purchase
belongs_to :user

## purchasesテーブル

| Column              | Type       | Options                      |
| ------------------  | ------     | -----------                  |
| user                | references | null:false,foreign_key: true |
| item                | references | null:false,foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_addresses

## shipping_addressesテーブル

| Column              | Type       | Options                       |
| ------------------  | ------     | -----------                   |
| purchase_record     | references | null: false,foreign_key: true |
| postal_code         | string     | null: false                   |
| prefecture          | string     | null: false                   |
| city                | string     | null:false                    |
| address_line1       | string     | null:false                    |
| address_line2       | string     |                               |
| phone_number        | string     | null:false                    |


###  Association

belongs_to :purchase


