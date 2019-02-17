require "#{Dir.pwd}/ruby_test/common"

# key, value セットで保存する。
$redis.set("key", "value")
# keyで取得
# p $redis.get("key")
# 特定のキーを削除
# $redis.del("key")
# $redis.expire("key", 10)
# p "10秒間sleep"
# sleep(10)
# p "keyを取得してみる"
# p $redis.get("key") #nilになる

# カウント
# incr 
# $redis.incr("count")
# p $redis.get("count")
# $redis.incr("count")
# p $redis.get("count")

__END__

[参考]
以下、redisコンテナから確認する方法

```
$ docker ps
$ docker exec -i -t container_name /bin/sh
# redisに入った後、redisを動かす
$ redis-cli
# 初期値
$ select 0
# 以下、redisコマンドで実行
# 参考情報:
# 公式: https://redis.io/commands
```
