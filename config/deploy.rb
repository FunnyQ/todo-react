# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'todoReact'
set :repo_url, 'git@github.com:funnyq/todo-react.git'
set :deploy_to, '/home/deployer/todo-react/'

set :linked_files, %w{config/database.yml}
set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# Default value for keep_releases is 5
# set :keep_releases, 5

# install bower components before assets precompile
before "deploy:assets:precompile", "bower:install"

namespace :bower do
  task :install do
    on roles(:app) do
      within release_path do
        execute :rake, 'bower:install'
      end
    end
  end
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
