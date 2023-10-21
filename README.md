# テーブル設計

## users テーブル ok1009 1415

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| profile            | string | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association ok1009 1448

- has_many :prototypes
- has_many :comments

## prototypes テーブル ok1009 1427   元rooms テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |  
| catch_copy | text       | null: false                   |
| concept    | text       | null: false                   |
| user       | references | null: false foreign_key: true |

### Association ok1009 1450

- belongs_to :users
- has_many   :comments

## commentsテーブル ok1009 1435    元messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association ok1009 1451

- belongs_to :users
- belongs_to :prototype

