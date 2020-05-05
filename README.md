# The Bookcafe DB

就職活動用のポートフォリオとして制作した自作アプリです。<br />
お気に入りのブックカフェを位置情報と共に投稿出来ます。機能としてはシンプルですが、開発環境にDocker、インフラにAWSを使用しています。

[![Screenshot from Gyazo](https://gyazo.com/c7057f516d70558e72e4563abbc0a7ac/raw)](https://gyazo.com/c7057f516d70558e72e4563abbc0a7ac)

## 制作背景

プログラミング学習を行う時に長時間滞在できて落ち着ける環境が少ないので、コワーキングスペースのように使用できるカフェを、投稿者同士で共有できればという想いでこちらのアプリを作成しました。



## URL
https://bookcafedb.com/

* ログインページから【testuser】として簡単ログインできます。

## 使用技術
* Ruby 2.5.1, Rails 5.0.7
* Nginx, unicorn
* AWS (EC2, RDS for MySQL, S3, VPC, Route53, ALB, ACM)
* Docker
* Capistrano
* RSpec
* SASS, Materializse, JQuery
* CircleCi CI/CD

## AWS構成図
![Untitled Diagram (2)](https://user-images.githubusercontent.com/54070896/77049390-5a46df00-6a0b-11ea-9533-b909b780166c.png)

## 機能一覧
* ユーザー登録・ログイン機能（deviseを使用）
* 投稿機能（画像のアップロードにCarrierWaveを使用）
* 投稿一覧・投稿詳細表示機能
* 投稿管理機能
* ページネーション機能（Kaminari）
* いいね機能（Ajax）
* コメント機能（Ajax）
* 検索機能（Ransackを使用）
* Rspecによる自動テスト機能
* フォロー・フォロワー機能
* googlemapにすべての投稿を表示
* 通知機能
* SNS登録・ログイン機能(Google/FaceBook/Twitter,omniauth)

## 課題、今後実装したい機能
* テストを充実させる
* 追加機能の実装
