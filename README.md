# テーブル設計

## usersテーブル
| column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| one_word_comment   | text   | null: false               |

### Association
- has_many :apps
- has_many :comments


## appsテーブル
| column      | Type       | Options                        |
| ----------- | -----------| ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| language    | string     | null: false                    |
| free        | text       | null: false                    |
| link        | string     | null: false                    |
| edit_count  | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user


## commentsテーブル
| column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| sentence | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| app      | references | null: false, foreign_key: true |


### Association
- belongs_to :app