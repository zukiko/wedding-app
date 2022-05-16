# アプリケーション名
Weddingpamph(ウェディングパンフ)  

# アプリケーションの概要
結婚式のWEB招待状、結婚式当日に配布する席次表、プロフィール、お食事メニュー、写真投稿機能など閲覧が  
可能なアプリケーションです。

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

# 利用方法

#### 招待状
- 結婚式へ招待されたゲストは、主催者から送付された[WEB招待状](https://weddingpamph.herokuapp.com/)より結婚式の日程、概要の確認が可能です。  
また、ページ内では、ゲストが参列有無の回答を行うことができます。

#### 結婚式パンフレット
- 結婚式当日にゲスト全員へQRコードよりパンフレットの[ログインページ](https://weddingpamph.herokuapp.com/users/sign_in)へアクセスをしてもらいます。  
アクセス後、招待状回答時に入力頂いたメールアドレスを元にログインしてもらいます。  
ログイン後は、ページ内に記載の席次表の確認や写真投稿などを行える仕組みとなっております。  

#### 管理画面
- 主催者側の結婚式準備の効率化削減のためのアプリケーションでもあるため管理者用メールアドレスで  
ログイン後、フッター部分にある【admin】より管理画面への遷移が可能です。  
管理画面内【Seating list】よりゲスト名、テーブル、席番号を指定することで自動的に席次表へ各ゲスト名が  
反映されます。また、ゲストへ向けたメッセージも同様に管理画面より記載することが可能です。  
メッセージは、各ゲストがログイン後、席次表ページより確認が可能です。  

# アプリケーションを作成した背景
自分自身が結婚式を行うにあたって準備等の効率化、ペーパーレスを考え招待状や当日の配布パンフレットを全てWEB化したいという背景がありアプリを作成しました。昨今、共働きの夫婦も多い中、結婚式準備は労力が必要となる点からWEBで主催者側が席次表の作成やメッセージの入力などが出来れば準備の効率化にもなると考えました。また、コロナ禍による急遽な欠席、式の延期等も多い中で紙媒体だと複数回の印刷や修正に時間やお金も必要となるため、それらをWEB化することでペ-パ-レスにも繋がり、さらに労力もかからないため他の演目へ費用捻出も可能だと考え作成を致しました。  

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1AScIBReq_3MnZccxr85HZuclkoOBhaAY1jD-Ft3wslw/edit#gid=982722306)

# 実装機能

### ・招待状トップ
ページ内には、結婚式の日程、概要、会場等の記載と合わせて招待状回答フォームへ遷移する「招待状に回答する」ボタンを用意しました。  
![readme1](https://user-images.githubusercontent.com/100673178/167079424-1ad1eae7-7a7c-4226-b340-b535d205be4b.gif)

### ・招待状入力機能
招待状フォームに結婚式への参列有無の回答ができます。入力完了後は、
「回答ありがとうございます」と表示されゲストへ回答が完了したことを示しています。  
![readme2](https://user-images.githubusercontent.com/100673178/167079431-6a511eb7-f677-47ad-9b4d-1b56de3bbf90.gif)

### ・結婚式当日のWEBパンフレットログインの流れ
WEBパンフレットログイン画面よりメールアドレスを入力後、結婚式パンフレットページへ
ログインが可能となります。  
こちらのログインURLは、結婚式当日にゲストへQRコードより読み取って頂きます。  
![readme3](https://user-images.githubusercontent.com/100673178/167079441-513cae31-646f-4ff8-a35b-14733ee77a52.gif)

### ・席次表ページ
席次表ページへ遷移後、上部へログインユーザーの名前とテーブル番号、メッセージが表示されます。下部へスクロールすると全体の席次表を表示しています。  
![readme4](https://user-images.githubusercontent.com/100673178/167079451-55cc4408-4bc8-4bba-b3e5-527f818cb25a.gif)

### ・写真投稿機能
写真投稿ボタンをクリック後、写真投稿ページへ遷移し、画像選択、テキスト入力完了後は、送信ボタンを押下すると写真一覧ページへ移動します。  
![readme5](https://user-images.githubusercontent.com/100673178/167079457-961ee713-5fde-4f69-81df-a765e5795fe2.gif)

横並び投稿済み写真は手動でスクロールが可能、また、写真をクリックすると非同期でクリックした写真を上部へ表示します。  
![readme6](https://user-images.githubusercontent.com/100673178/167079661-ff099bbf-d698-4b8c-8e19-659ae6e6028a.gif)


### ・写真削除機能
ログインユーザー且つ投稿写真の投稿者のみが写真の削除の実行が可能です。  
![readme7](https://user-images.githubusercontent.com/100673178/167079669-431b0694-e5c9-4210-8161-e4909dfd83b8.gif)


# 実装予定の機能
- 招待状入力後、確認メールを回答者へ送信  
- 招待状フォーム内下部に「お連れ様を追加」機能を追加  
- 写真一覧ページの画像サイズの見直し  
- 食事メニューページ

# ER図
[![ER図](https://i.gyazo.com/23af62be7da381365ab5b3db900f6306.png)](https://gyazo.com/23af62be7da381365ab5b3db900f6306)

# 画面遷移図
[![画面遷移図](https://i.gyazo.com/e60f5bdc82a6cb839c3b80f61fbd4c72.png)](https://gyazo.com/e60f5bdc82a6cb839c3b80f61fbd4c72)

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
- Github
- Visual Studio Code

# 工夫したポイント
- 管理画面を作成することで主催者が自由に席次表の配置変更やゲスト宛メッセージの修正を行えるようにしました。
- ゲストは当日お持ちの携帯でアプリケーションにアクセスしてもらうことを予測し、席次表ページへ遷移した際に、  
一目で自分自身のテーブル番号がどこか分かる様に上部へ名前とテーブル番号を表示しました。
- パンフレット内はページ遷移がスムーズに行えるようハンバーガーメニューをヘッダー部分に作成しました。
- 写真投稿機能では、下部の画像一覧より投稿画像、投稿者名、コメントをワンクリックで大きく表示し、  
投稿者の画像については削除可能にしました。
