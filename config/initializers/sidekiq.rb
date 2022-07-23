# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'

redis_params = {
  url: ENV['REDIS_URL_SIDEKIQ'],
  namespace: ENV['REDIS_NAMESPACE']
  # { url: 'redis://localhost:6379/0' }
}

# Stats:
# concurrency: sidekiq client does not need concurrency options
# size: 5 - default
Sidekiq.configure_client do |config|
  config.redis = redis_params
end

# Stats:
# concurrency: 5
# size: 10 ( concurrency + 5 )
Sidekiq.configure_server do |config|
  config.redis = redis_params
end

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  # Protect against timing attacks:
  # - See https://codahale.com/a-lesson-in-timing-attacks/
  # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
  # - Use & (do not use &&) so that it doesn't short circuit.
  # - Use digests to stop length information leaking
  Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(user), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USER"])) &
  Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
end
