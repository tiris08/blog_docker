Sidekiq.configure_server do |config|
  config.redis = {
    host: ENV['REDISHOST'],
    port: ENV['REDISPORT'] || '6379',
    url: ENV['REDIS_URL'] || 'redis://redis:6379/1'
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV['REDISHOST'],
    port: ENV['REDISPORT'] || '6379',
    url: ENV['REDIS_URL'] || 'redis://redis:6379/1'
  }
end