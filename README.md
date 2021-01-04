## usersテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |      
| encrypted_password | string     | null: false              |
| email              | string     | null: false, unique:true |
| nickname           | string     | null: false              |
| first_name         | string     | null: false              |
| last_name          | string     | null: false              |
| first_name_kana    | string     | null: false              |
| last_name_kana     | string     | null: false              |
| birthday           | date       | null: false              |

### Association

- has_many  :items
- has_many  :item_deliveries

## itemsテーブル

| Column             | Type       | Options           |
| -------------------| ---------- | ------------------|
| name               | string     | null: false       |
| expranation        | text       | null: false       |
| category_id        | integer    | null: false       |
| price              | integer    | null: false       |
| quality_id         | integer    | null: false       |
| delivery_burden_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| shipping_id        | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- has_one :item_delivery
- belongs_to :user

## item_deliveriesテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

| Column              | Type       | Options           |
| --------------------| ---------- | ----------------- |
| postal_code         | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| municipalities      | string     | null: false       |
| address             | string     | null: false       |
| quality             | string     | null: false       |
| building_name       | string     |                   |
| phone_number        | string     | null: false       |
| item_delivery       | references | foreign_key: true |

### Association

- belongs :item_delivery

