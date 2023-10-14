# Back

Gem のアップデート

```bash
$ docker-compose run back bundle install
$ docker-compose build
```

Docker の立ち上げ

```bash
$ docker-compose up -d
```

データベースの作成

```bash
# データベースの作成
$ docker-compose run back rails db:create
# テーブルの作成
$ docker-compose run back rails db:reset
```

マイグレーション

```bash
$ docker-compose run back rails db:migrate
```
