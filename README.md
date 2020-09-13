# THERAPIST FIND APP
国家資格を持っている施術者(柔道整復師、鍼灸師、理学療法士など)の方と、利用者をマッチングする為のアプリです。
「いつでも、好きな時間に」をテーマに、利用者の方も施術者の方も使いやすいアプリケーションの実現を目指します。

# 概要
ユーザー（利用者）が、セラピスト（施術者）を予約する事ができるアプリです。
セラピストは、自分自身のプロフィールを投稿する事ができます。
ユーザーは、一覧画面からセラピストを選択し、希望日時と必要な情報を入力する事で、そのセラピストを予約する事ができます。

# 制作背景
知人が柔道整復師としての新しい働き方を模索しており、利用者（施術希望者）と施術者を繋ぐ為のアプリが欲しいと相談された事がきっかけです。
また、私自身も、外出するのが中々難しい中で、自分の好きな時間にセラピストに自宅に来てもらう事ができたらいいなと考えました。
現状、治療院と呼ばれる接骨院や整体院、整形外科などは、日曜や祝日がお休みであったり、夜遅くまで営業しているところはほとんどありません。
そんな中で、施術者の方達の新しい働き方であったり、中々時間が合わない利用者の方に治療を届けたいという思いから、このアプリを作成することを決意いたしました。

# DEMO

# 工夫したポイント
なるべく使いやすいシンプルなUIを心がけました。

# 使用技術
- Ruby 2.6.5
- Rails 6.0.3.2

# 課題や今後実装したい機能
予約をする前にメッセージのやりとりができる機能や、お気に入り登録機能、自分が予約をしたセラピストなどを確認できる機能などを実装したいと考えております。
また、その施術者が予約の入っている時間などは予約できないように、制限の機能なども実装したいと考えております。

# DB設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |

### Association
- has_many :reservations

## therapists テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| name_kana           | string     | null: false                    |
| email               | string     | null: false                    |
| password            | string     | null: false                    |
| gender              | string     | null: false                    |
| birthday            | date       | null: false                    |

### Association
- has_one :product

## products テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| qualification_id  | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| self_introduction | text       | null: false                    |
| price             | integer    | null: false                    |
| therapist_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :therapist
- has_many :reservations
- has_many :user_informations

## reservations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |
| datetime   | datetime   | null: false                    |

## Association
- belongs_to :user
- belongs_to :product

## user_informations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| full_name      | string     | null: false                    |
| full_name_kana | string     | null: false                    |
| gender         | string     | null: false                    |
| age            | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| product_id     | references | null: false, foreign_key: true |

## Association
- belongs_to :product