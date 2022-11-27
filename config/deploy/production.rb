# frozen_string_literal: true

set :stage, :production
set :server, '152.70.197.189'
set :user, 'rails'

server '152.70.197.189', user: 'rails', roles: %w[app db web]

set :rbenv_ruby, File.read('.ruby-version').strip

set :application, 'rails_boilerplate'
set :repo_url, 'git@github.com-per:vinhmai570/rails_boilerplate.git'

# Default branch is :master
set :branch, 'develop'
set :deploy_to, '/data/rails_boilerplate'

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# capistrano-rails
set :rails_env, :production
set :migration_role, :web

# capistrano/bundler
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_path, -> { shared_path.join('bundle') }
set :bundle_without, %w[development test].join(' ')
set :bundle_jobs, 4
set :bundle_flags, '--deployment --quiet'

# capistrano/puma
set :puma_user, fetch(:user)
set :puma_conf, -> { "#{shared_path}/config/puma/production.rb" }
set :puma_role, :web
set :puma_workers, 2

# capistrano/sidekiq
set :sidekiq_config, 'config/sidekiq.yml'

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
 set :ssh_options, {
   forward_agent: true
 }
