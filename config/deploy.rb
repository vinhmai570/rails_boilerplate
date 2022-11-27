# frozen_string_literal: true

# config valid only for current version of Capistrano
lock '~> 3.17.0'

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
set :linked_files, ['config/master.key', ".env.#{fetch(:stage)}"]

# Default value for linked_dirs is []
set :linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'bundle', 'config/puma', 'node_modules', 'public/uploads']
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3
set :local_user, 'rails'
set :use_sudo, false

set :slack_url, 'your_slack_hook_url'

namespace :yarn do
  desc 'Run rake yarn install'
  task :install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end

namespace :deploy do
  desc 'Upload config file.'
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/public"
      execute "mkdir -p #{shared_path}/config"
      execute "mkdir -p #{shared_path}/config/puma"
      upload!("config/puma/#{fetch(:stage)}.rb", "#{shared_path}/config/puma/#{fetch(:stage)}.rb")
      upload!(".env.#{fetch(:stage)}", "#{shared_path}/.env.#{fetch(:stage)}")
      upload!('config/master.key', "#{shared_path}/config/master.key")
    end
  end

  # before :deploy, 'deploy:upload_yml'
end

namespace :db do
  task :setup do
    on roles(:app) do
      within current_path do
        with(rails_env: :production) do
          execute :bundle, :exec, :rake, 'db:setup'
        end
      end
    end
  end

  desc 'Seed the database.'
  task :seed do
    on roles(:app) do
      within current_path do
        with(rails_env: :production) do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  desc 'Reset database'
  task :reset do
    on roles(:app) do
      within current_path do
        with(rails_env: :production) do
          execute :bundle, :exec, :rake, 'db:drop db:create db:migrate'
        end
      end
    end
  end
end

task :log do
  on roles(:app) do
    execute "cd #{shared_path}/log && tail -f #{fetch(:stage)}.log"
  end
end
