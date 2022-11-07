require 'sidekiq/web'
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379', namespace: Rails.env, network_timeout: 15 }
end
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379', namespace: Rails.env, network_timeout: 15 }
end
