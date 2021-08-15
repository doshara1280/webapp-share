# テーブル設計

## usersテーブル
| column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| one_word_comment   | text   | null: false               |

### Association
- has_many :web_apps
- has_many :comments
- has_one :web_app_declaration
- has_many :declaration_comments


## web_appsテーブル
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
| web_app  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :web_app


## web_app_declarationsテーブル
| column      | Type       | Options                        |
| ----------- | -----------| ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| days        | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## declaration_commentsテーブル
| column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| sentence            | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| web_app_declaration | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :declaration_comment