
# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birthday           | string              | null: false             |

### Association

* has_many :items

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| text                                | text       | null: false       |
| category                            | string     | null: false      |
| status                              | string     | null: false       |
| price                               | integer    | null: false      |
| postage                             | integer    | null: false      |
| place                               | string     | null: false       |
| date                                | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :buys

## buys table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| card        | text       | null: false       |
| expiration  | text       | null: false       |
| security    | text       | null: false       |


### Association

- belongs_to :items
- has_one :address

# address table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| postcode       | string      | null: false       |
| prefecture_id  | string      | null: false       |
| city           | string      | null: false       |
| block          | string      | null: false       |
| building       | string      | null: false       |
| phone          | string      | null: false       |



### Association

- belongs_to :items
