# テーブル設計

## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth      | date | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :order


## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false |
| shipping_area_id | references | null: false, foreign_key: true |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone         | string     | null: false |

### Association
- belongs_to :order


## orders テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses


## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false |
| introduction  | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| postage_id       | integer    | null: false |
| shipping_area_id | integer    | null: false |
| shipping_days_id | integer    | null: false |
| price         | integer     | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order
- has_many :comments


## comments テーブル
| Column  | Type       | Options                        
| ------- | ---------- | ------------------------------ 
| text    | text       | null: false |
| user    | references | null: false, foreign_key: true 
| item    | references | null: false, foreign_key: true 

### Association
- belongs_to :user
- belongs_to :item