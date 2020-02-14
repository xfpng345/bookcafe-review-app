lock '3.11.2'

set :application, 'bookcafe-review-app'

set :repo_url,  'git@github.com:xfpng345/bookcafe-review-app.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# set :linked_files, fetch(:linked_files, []).push('config/settings.yml')

set :deploy_to, '/var/www/projects/bookcafe-review-app'

set :rbenv_type, :user

set :rbenv_ruby, '2.5.1'

set :log_level, :debug

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/first_aws_rsa'],
                  forward_agent: true

# set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }


set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end