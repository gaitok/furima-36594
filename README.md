
# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| nickname           | string              | null: false,unique: true |
| email              | string              | null: false              |
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| last_name          | string              | null: false              |
| first_name_kana    | string              | null: false              |
| last_name_kana     | string              | null: false              |
| birthday           | date                | null: false              |

### Association

* has_many :items
* has_many :buys

## items table

| Column                          | Type       | Options           |
|---------------------------------|------------|-------------------|
| title                           | string     | null: false       |
| text                            | text       | null: false       |
| category_id                     | integer     | null: false      |
| status_id                       | integer    | null: false       |
| price_id                        | integer    | null: false       |
| postage_id                      | integer    | null: false       |
| place_id                        | integer    | null: false       |
| day_id                          | integer    | null: false       |
| user                            | references | foreign_key: true |

### Association

- belongs_to :user


## buys table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true | 
| items       | references | foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
* has_one :address


# address table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| postcode       | string      | null: false       |
| place_id       | integer     | null: false       |
| city           | string      | null: false       |
| block          | string      | null: false       |
| building       | string      |        |
| phone          | string      | null: false       |
| user           | references  | foreign_key: true |


### Association
- belongs_to :item
- belongs_to :buys
