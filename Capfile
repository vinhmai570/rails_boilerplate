# frozen_string_literal: true

# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/sidekiq'
install_plugin Capistrano::Sidekiq
install_plugin Capistrano::Sidekiq::Systemd
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/puma'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Systemd
install_plugin Capistrano::Puma::Nginx
# require 'seed-fu/capistrano3'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
# require 'capistrano/slackify' # gem for notification to slack

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
