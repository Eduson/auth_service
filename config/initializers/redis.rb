# frozen_string_literal: true

redis_url = ENV['REDIS_URL']
$redis = Redis.new(url: redis_url)
AuthService::Application.config.session_store :redis_store, servers: redis_url, domain: '*'
