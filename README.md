## usersテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| nickname         | string     | null: false |
| first_name       | string     | null: false |
| last_name        | string     | null: false |
| first_name_kana  | string     | null: false |
| last_name_lana   | string     | null: false |
| birthday         | datetime   | null: false |

### Association

- has_many :items
- has_many :deliveries

## itemsテーブル

| Column           | Type       | Options     |
| -----------------| ---------- | ------------|
| item_name        | text       | null: false |
| item_expranation | text       | null: false |
| category         | string     | null: false |
| price            | integer    | null: false |

### Association

- has_many :item_deliveries
- has_many :delivery, through: :item_deliveries
- belongs_to :user

## item_deliveriesテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| item     | references | foreign_key: true |
| delivery | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :delivery

## deliveryテーブル

| Column              | Type       | Options     |
| --------------------| ---------- | ----------- |
| postal_code         | integer    | null: false |
| prefectures         | string     | null: false |
| municipalities      | string     | null: false |
| address             | string     | null: false |
| quality             | string     | null: false |
| building_name       | string     | null: false |
| shipping_area       | string     | null: false |
| shipping_fee_burden | string     | null: false |
| days_to_ship        | string     | null: false |
| phone_number        | integer    | null: false |

### Association

- has_many :item_deliveries
- has_many :item, through: :item_deliveries
- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Column              | Type       | Options     |
| --------------------| ---------- | ----------- |
| credit_number       | integer    | null: false |
| expiration_date     | integer    | null: false |
| security_code       | integer    | null: false |


### Association

- belongs_to :delivery
