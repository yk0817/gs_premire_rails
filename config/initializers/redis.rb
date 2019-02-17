$redis = Redis.new \
  url: ENV["REDIS_URL"],
  port: ENV["REDIS_PORT"]
