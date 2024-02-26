## Thankyoupon

### サービス概要
感謝の気持ちを表現できるオリジナルクーポン券を、LIFFアプリケーションを通じて作成・共有できるサービスです。  
ユーザーはLINEアプリ内で直接、テンプレートを選んだりAIを活用して、心のこもったクーポン券を簡単に作成し、LINE経由で共有できます。  
具体的には、「肩たたき券」など、モノではなくコトを贈ることができます。

### このサービスへの思い・作りたい理由
私が受講しているプログラミングスクールのRUNTEQでは、常に心に留め、体現すべきマインド指針の一つとしてGive Firstがあります。  
Give Firstとは、相手に何かを求める前に、まずは与えることを意識する精神です。Giveを最初に始める人がいることでGive & Takeの良い循環が生まれます。  
コミュニティ内ではこのGive First精神を持った方が多く、私自身同期からカリキュラムの内容で助けてもらう等、多くのGiveを貰っています。  
一方で私からも何かGiveしたいな、だけど何もお返しできるものが無いな、という悩みを抱えていました。  
ある時、お返しするものはカリキュラムやプログラミング技術に関するものでなくても良いのでは？と思いつき、自分が提供できるものをクーポン券として贈れるアプリを作ろうと考えました。  
このアプリは、前職の先輩から「いつもありがとう」と、先輩の名前入りクーポン券（忙しい時に先輩に仕事を依頼できる券）を貰って、とても嬉しかった経験からヒントを得ています。  
クーポン券は付箋一枚で数秒で作成できるようなものでしたが、先輩の心遣いが温かく、使うことが勿体無くて結局使えませんでしたが、とても心に残る贈り物でした。  
ユーザーにこのような心温まる体験を提供できたら嬉しいです。

### ユーザー層について
- Giveをお返ししたいけど、お返しできるものが無いなと悩んでいるRUNTEQ生
- お世話になっている家族、友人、同僚へ感謝の気持ちを伝えたいLINEユーザー

### サービスの利用イメージ
- テンプレートクーポン券: LINEアプリ内で複数のテンプレートから選択し、簡単に共有できます。感謝の気持ちをすぐに伝えることができるので便利です。
- オリジナルクーポン券: デザインを選択後、オリジナルなクーポン券の中身を記載してプレビュー後、LINEで共有できます。心のこもったクーポン券を贈ることで、相手にも喜んでもらえます。
- AIでクーポン券生成: ユーザーが提供した情報（趣味や得意なもの等）に基づいて、AIがオリジナルのクーポン券を提案し、そのまま共有できます。

### ユーザーの獲得について
RUNTEQコミュニティ、X（旧Twitter）での宣伝  
初期ユーザーはRUNTEQ生を見込んでいますが、クーポン券を受け取ったユーザーに喜びを提供することで、新たなユーザーとして獲得できるのではと考えています。

### サービスの差別化ポイント・推しポイント
類似サービスとしてCanvaが挙げられますが、当サービスはオリジナルクーポン券に特化したアプリとして差別化を図ります。  
Canvaでは豊富なデザインテンプレートからテキストやレイアウトをカスタマイズして作成したものを共有、印刷が可能です。   
https://www.canva.com/ja_jp/create/cards/thank-you-cards/

対して、当サービスの差別化ポイント、推しポイントは以下の通りです。
- 即時利用可能なテンプレート: ユーザーは、カスタマイズせずにすぐに利用できるクーポン券をテンプレートから選ぶことができます。
- 共有によるコンテンツ拡充: ユーザーが作成したオリジナルクーポン券を公開することで、サービス内のクーポン券バリエーションが豊かになります。
- AIの活用: AIを使用して、ユーザーのニーズに合わせたクーポン券を提案します。

### 機能候補

#### MVPリリース
- LINEログイン（会員登録）機能
- クーポン券一覧機能
- クーポン券作成、編集、削除機能
  - 作成したクーポン券は一覧への公開・非公開を選択可能
  - 有効期限の設定も可能
- クーポン券共有機能
- クーポン券検索機能（クーポン内容、送信先カテゴリ）
- クーポン券お気に入り機能
- マイページ
  - 作成したクーポン券一覧機能
  - お気に入りクーポン券一覧機能
  - クーポン券詳細閲覧機能
- プロフィール編集機能

#### 本リリース
- AIでクーポン券自動生成機能
- クーポン券一覧にAI生成されたクーポン券を追加
- クーポン券の有効期限LINE通知機能
- 貰ったクーポン券一覧機能
- 贈ったクーポン券一覧機能
- X（旧Twitter）シェア機能

### 機能の実装方針予定

#### 開発環境
- Docker

#### バックエンド
- Ruby 3.2.2
- Ruby on Rails 7.0.8

#### フロントエンド
- JavaScript
- LINE Front-end Framework（LIFF）

#### CSSフレームワーク
- Tailwind CSS

#### インフラ
- Heroku

#### 画像加工・合成
- Cloudinary

#### API
- OpenAI API
- LINE Messaging API

## 画面遷移図
https://www.figma.com/file/TOFZjly4T9LZhh8XoDbnSZ/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=A7EIH1wPaxPrpXRQ-1

## ER図
[![Image from Gyazo](https://i.gyazo.com/6d661e7cb0fb5e1f24a7d534297d08db.png)](https://gyazo.com/6d661e7cb0fb5e1f24a7d534297d08db)