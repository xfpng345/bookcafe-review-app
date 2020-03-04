# The Bookcafe DB

就職活動用のポートフォリオとして制作した自作アプリです。<br />
お気に入りのブックカフェを位置情報と共に投稿出来ます。機能としてはシンプルですが、開発環境にDocker、インフラにAWSを使用しています。

[![Screenshot from Gyazo](https://gyazo.com/0793fb40108b7baa77c4b21730b91372/raw)](https://gyazo.com/0793fb40108b7baa77c4b21730b91372)

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

## AWS構成図
![Untitled Diagram](https://user-images.githubusercontent.com/54070896/75841028-13a09480-5e10-11ea-89cc-70cee38b4abc.png)

## 機能一覧
* ユーザー登録・ログイン機能（deviseを使用）
* 投稿機能（画像のアップロードにCarrierWaveを使用）
* 投稿一覧・投稿詳細表示機能
* 投稿管理機能
* ページネーション機能（Kaminari）
* いいね機能（Ajax）
* コメント機能（Ajax）
* 検索機能（Ransackを使用）
* 管理ユーザー機能（一般ユーザーのアカウントや投稿を削除可能）
* Rspecによる自動テスト機能

