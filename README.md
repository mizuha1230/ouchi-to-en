< アプリケーションの概要 >
# アプリケーション名
- ouchi-to-en
# アプリケーション概要
- 家庭と保育園をつなぐアプリ。
- 家庭と保育園で一対一の連絡を取り合うことができる。（連絡帳の役割）
- 保育園は、1日の活動内容を投稿し、保護者はそれを見ることで、子どもの保育園での様子を知ることができる。
- 保育園は、持ち物や行事などの連絡事項を投稿し、保護者は必要な情報を得ることができる。
- カレンダーに行事を書き込むことができ、アプリで行事を確認できる。
# URL
- https://ouchi-to-en.herokuapp.com/
# テスト用アカウント
- アカウント1(メールアドレス：mizuha@test.com, パスワード：test12)
- アカウント2(メールアドレス：tarou@test.com, パスワード：test12)
# 利用方法
- パソコン・スマートフォン・タブレットで使用できる。
# 目指した課題解決
- ターゲット：３、４、５歳児の子どもを育てる保護者と子どもを保育する保育園の職員
- 課題１：保護者は、毎日子育てと仕事の両立をする中で、保育園の持ち物の準備や連絡事項の確認、連絡帳の記入なども行っている。また、子どもの送り迎えの時間では、なかなか保育者と話す機会が少なく、聞きたいことを連絡帳に書きたいけれど、忙しくて書く時間がないことも多いのが現状。さらに、保育園から配布される毎月のお便りは、兄弟がいたりすると枚数が増え、きちんと整理していないと見たいときにすぐに見ることができない。
- 課題２：保育者は、毎日の保育準備と保育活動に加え、1日の活動内容を掲示板に記入・指導案の作成・子どもの成長記録の記入・お便りの作成と配布など、保育以外の仕事も多く、連絡帳は休憩時間に記入したり、特別な連絡事項がある家庭に対してのみの記入になってしまったりすることも多い。また、お便りなどで大事な連絡事項を伝えているものの、忙しい保護者にうまく伝わらないことがあるため、結局、口頭で伝えたり、一人一人の連絡帳にお便りと同じ内容の連絡事項を記入したりしなければいけないこともある。
- 課題を解決するために目指したこと：保護者は、スマートフォンでどこでも連絡帳を記入でき、すぐにお便りや大事な連絡事項を確認でき、ゆっくり子どもの保育園での様子を知ることができる。保育者は、スマートフォンやパソコンひとつで、アプリにお便りを添付、大事な連絡事項の記入、1日の活動報告、一人一人の保護者との連絡ができることで、仕事の効率化を図る。
# 洗い出した要件
- 連絡ルーム管理機能
- 連絡ルーム削除機能
- ユーザー管理機能
- 活動内容一覧表示機能
- 活動内容投稿機能
- 活動内容詳細表示機能
- 詳細ページの投稿内容編集機能
- 詳細ページの投稿内容削除機能
# 実装した機能についての画像やGIFおよびその説明
- トップページ（活動内容一覧ページ）
[![Image from Gyazo](https://i.gyazo.com/b754b952bd094446f1df6d9e949126e6.png)](https://gyazo.com/b754b952bd094446f1df6d9e949126e6)
- 新規活動内容投稿ページ
[![Image from Gyazo](https://i.gyazo.com/78cc6db9edff24cae52c1258e1d9e8d5.png)](https://gyazo.com/78cc6db9edff24cae52c1258e1d9e8d5)
- 活動内容詳細ページ
[![Image from Gyazo](https://i.gyazo.com/af5152aaa3861832001972c3d566f870.png)](https://gyazo.com/af5152aaa3861832001972c3d566f870)
[![Image from Gyazo](https://i.gyazo.com/8de358559b2f4777c4959af196b526bd.png)](https://gyazo.com/8de358559b2f4777c4959af196b526bd)
- 連絡ルームトップページ
[![Image from Gyazo](https://i.gyazo.com/2d2039d0a547719cd1bb5a0cae917e82.png)](https://gyazo.com/2d2039d0a547719cd1bb5a0cae917e82)
- 連絡ルーム作成ページ
[![Image from Gyazo](https://i.gyazo.com/aef40d6a0238fcba103cbab76ad7643d.png)](https://gyazo.com/aef40d6a0238fcba103cbab76ad7643d)
- 連絡ルームのメッセージ一覧・送信
[![Image from Gyazo](https://i.gyazo.com/ee6c6aa5143651087daafe5ceed9153e.png)](https://gyazo.com/ee6c6aa5143651087daafe5ceed9153e)
- カレンダー
[![Image from Gyazo](https://i.gyazo.com/1e2b44fb259250a2b0885979dcd57c4e.png)](https://gyazo.com/1e2b44fb259250a2b0885979dcd57c4e)
- カレンダー行事投稿機能 
[![Image from Gyazo](https://i.gyazo.com/b97acaccb47be1fb5d49130beb60f682.png)](https://gyazo.com/b97acaccb47be1fb5d49130beb60f682)
# 実装予定の機能
- 
# データベース設計
- ER図
[![Image from Gyazo](https://i.gyazo.com/3a80452e570c7f6b63c94c9f62b974c3.png)](https://gyazo.com/3a80452e570c7f6b63c94c9f62b974c3)
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :activities
- has_many :events

## rooms テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| room_name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

image(画像)はActiveStorageを用いて実装する

## activities テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| activity_content | text       | null: false                    |
| contact          | string     |                     |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

image(画像)はActiveStorageを用いて実装する

## events テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| start            | datetime   |                                |
| end_time         | datetime   |                                |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

