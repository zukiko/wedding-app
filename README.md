# アプリケーション名
Weddingpamph(ウェディングパンフ)  

# アプリケーションの概要
結婚式の招待状、結婚式当日に配布する席次表、プロフィール、お食事メニュー、写真投稿機能など閲覧が可能なアプリケーションです。

# URL
Herokuによるデプロイ  
https://weddingpamph.herokuapp.com/

# テスト用アカウント
Basic認証  
- ID : pfkzk  
- パスワード : 7359  

管理者用  
- メールアドレス : admin@pamph.jp  

ゲスト用  
- メールアドレス : test1@pamph.jp  

# アプリケーションを作成した背景
自分自身が結婚式を行うにあたって準備等の効率化、ペーパーレスを考え招待状や当日の配布パンフレットを全てWEB化したいという背景がありアプリを作成しました。  
昨今、共働きの夫婦も多い中、結婚式準備は労力必要となる点からWEBで主催者側が席次表の作成やメッセージの入力などが出来れば準備の効率化にもなると考えました。また、コロナ禍による急遽な欠席、式の延期等も多い中で紙媒体だと複数回の印刷や修正に時間やお金も必要となるため、それらをWEB化することでペーパレスにも繋がり労力もかからないため他の演目に費用の捻出も可能だと考え作成を致しました。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1AScIBReq_3MnZccxr85HZuclkoOBhaAY1jD-Ft3wslw/edit#gid=982722306)

# 実装機能
### ・招待状トップ
[![Image from Gyazo](https://i.gyazo.com/3b8ce28091bc788bb20084e361349c34.gif)](https://gyazo.com/3b8ce28091bc788bb20084e361349c34)

### ・招待状入力機能
招待状フォームに結婚式への参列有無の回答ができます。入力完了後は、
回答ありがとうございましたと表示されます。
[![Image from Gyazo](https://i.gyazo.com/54f42671f6cb068ab62bebb5a963bfad.gif)](https://gyazo.com/54f42671f6cb068ab62bebb5a963bfad)

### ・結婚式当日のWEBパンフレットログインの流れ
WEBパンフレットログイン画面よりメールアドレスを入力後、WEBパンフレットページへ
ログインが可能となります。
[![Image from Gyazo](https://i.gyazo.com/4d188134c9df85dc1812574780bc99da.gif)](https://gyazo.com/4d188134c9df85dc1812574780bc99da)

### ・席次表ページ
席次表ページへ遷移後、上部へログインユーザーの名前とテーブル番号、メッセージが表示されます。下部へスクロールすると全体の席次表を表示しています。
[![Image from Gyazo](https://i.gyazo.com/3fa9aefcdd4f324492f2c10ba4b05568.gif)](https://gyazo.com/3fa9aefcdd4f324492f2c10ba4b05568)

### ・写真投稿機能
写真投稿ボタンをクリック後、写真投稿ページへ遷移し、画像選択、テキスト入力完了後は、送信ボタンを押下すると写真一覧ページへ移動します。
[![Image from Gyazo](https://i.gyazo.com/1c5e5cfeb8cf1bc4645acc17be252455.gif)](https://gyazo.com/1c5e5cfeb8cf1bc4645acc17be252455)

横並び投稿済み写真は手動でスクロールが可能、また、写真をクリックすると非同期でクリックした写真を上部へ表示します。
[![Image from Gyazo](https://i.gyazo.com/d0601b281d0da5cb37f44c1f746eb560.gif)](https://gyazo.com/d0601b281d0da5cb37f44c1f746eb560)


### ・写真削除機能
ログインユーザー且つ投稿写真の投稿者のみが写真の削除の実行が可能です。
[![Image from Gyazo](https://i.gyazo.com/79a101794129096a8e14458e675c17d7.gif)](https://gyazo.com/79a101794129096a8e14458e675c17d7)

# 実装予定の機能
- 招待状入力後、確認メールを回答者へ送信  
- 招待状フォーム内下部に「お連れ様を追加」機能を追加  
- 写真一覧ページの画像サイズの見直し  
- 写真投稿機能内の投稿内容の編集ページの追加  
- 新郎新婦のプロフィールページ  
- 食事メニューページ

# ER図
![wedding](https://user-images.githubusercontent.com/100673178/166861337-7a52789b-8fc8-4d8e-9e4c-59f9720a6d3d.png)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/951ef69a4902035156cbfbb16348457e.png)](https://gyazo.com/951ef69a4902035156cbfbb16348457e)

### 招待状ページ
[招待状](https://weddingpamph.herokuapp.com/)

### 結婚式当日パンフレット　ログインページ
[ログインページ](https://weddingpamph.herokuapp.com/users/sign_in)


#  テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | -------------------------|
| attendance         | string  | null: false              |
| bride_groom        | string  | null: false              |
| name               | string  | null: false              |
| name_kana          | string  | null: false              |
| postal_code        | string  | null: false              |
| prefecture_code    | string  | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  |                          |
| allergy            | text    |                          |
| bus                | text    |                          |
| email              | string  | null: false,unique: true |
| admin              | boolean | default: false           |


### Association

- has_one :seating_list
- has_many :photos

## seatinglists テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| table            | string     | null: false                    |
| seat_number      | integer    | null: false                    |
| message          | text       |                                |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## photos テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| text       | text       | null: false                    |

### Association

- belongs_to :user

# 開発環境

- ruby 2.6.5
- Rails 6.0.0
- MySQL2 0.4.4