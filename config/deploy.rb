lock '~> 3.11.0'

set :application, 'usagle'
set :repo_url, 'git@github.com:usagle/usagle_app.git'

set :deploy_to, '/home/deployer/usagle'
set :deploy_user, 'deployer'

set :linked_files, %w{config/database.yml .env.production}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/uploads}

set :default_shell, '/bin/bash -l'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart
end