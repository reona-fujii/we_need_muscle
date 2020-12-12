# We Need Muscle
<img width="1654" alt="top-image" src="https://user-images.githubusercontent.com/69830905/100492574-dedc2680-3170-11eb-921f-66a1438f827a.png">

## サイト概要

&emsp;筋トレを継続的にやっているが、重量が上がらない。筋肉がついた感がない。
それらの問題は、食事に起因します。
食事管理を適当にしていると、いくら筋トレをしても効果的に筋肉をつけるのは難しいです。
このサイトは、自分の食事内容やサプリメント等の投稿を他人とシェアすることで、より効果的なボディメイクを行うことができます。</br>
&emsp;基本機能として、食事内容の新規投稿やその投稿に対するコメントができます。
また、他ユーザーの投稿に「いいね」をすることができます。
マイページには、投稿に基づいた食事内容を入力することができ、カレンダーで日々の食事内容を管理することができます。
コメント（レビュー）機能については、コメント内容がポジティブ要素の強いものか、ネガティブ要素の強いものかを判定し、スコアリングすることができます。</br>
URL:<http://we-need-muscle.work/>

### サイトテーマ

トレーニングしている人同士で食事内容の投稿を共有することで、</br>食事管理をサポートし、筋トレ効果を高めるサイト

### テーマを選んだ理由

私も筋トレをしていて、食事管理の重要性と難しさを感じているから

### ターゲットユーザー

- ボディメイクしている方
- 筋トレであまり成果が感じられない方

### 主な利用シーン

- 1 日が終わったときにその日の食事内容を入力（マイページ）
- 献立を考えているときの参考に

# 設計書

## ER図
<img width="700" alt="ER図" src="https://user-images.githubusercontent.com/69830905/100948613-998e6f00-354b-11eb-8bb7-bb2884056220.png">
## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails 5.2.4.4
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用技術（gem等）

- pry-byebug
- devise
- enum_help
- bootstrap4
- jquery-rails
- refile
- refile-mini_magick
- kaminari
- simple_calendar
- dotenv-rails
- lightbox2
- rubocop
- rubocop-performance
- rubocop-rails
- chartkick
- rspec-rails
- factory_bot_rails

主な機能
- ユーザー登録機能
  - ログイン、ログアウト、新規登録
  - プロフィール編集、パスワード変更、退会
- 食事投稿機能
  - 新規投稿、編集、削除
- コメント機能
  - 新規投稿、削除
- レビュー機能
- お気に入り機能
- カレンダー機能
- チャート機能
- 検索機能
  - ユーザー検索
  - 食事名検索
- 画像拡大機能
- 非同期通信
  - コメントの投稿と削除
  - お気に入りの追加と削除

### 機能一覧

https://docs.google.com/spreadsheets/d/12PB1fxQaborREhhHE3czWXjQwhirstfaHboRhVc7Svk/edit?usp=sharing

## 使用素材

- ICOON MONO
- O-DAN
- Linustock