# ruby実行環境の作り方

## mysqlセットアップ

```
# コンテナに入る
$ docker exec -i -t gs-premire-rails_db_1 /bin/sh
$ mysql -u root -p # passwordを入力
$ create database ruby_study;
$ docker-compose run web ruby ruby_test/create_table.rb
```
