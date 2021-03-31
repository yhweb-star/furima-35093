# テーブル設計

## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :address
- has_one :card


## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone         | string     | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## cards テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| number        | string     | null: false |
| exp_year      | integer    | null: false |
| exp_month     | integer    | null: false |
| security_code | string     | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false |
| title         | string     | null: false |
| introduction  | text       | null: false |
| category      | integer    | null: false |
| status        | integer    | null: false |
| postage       | integer    | null: false |
| shipping_area | integer    | null: false |
| shipping_days | integer    | null: false |
| price         | string     | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
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