lock '~> 3.11.0'

set :application, 'usagle'
set :repo_url, 'git@github.com:usagle/usagle_app.git'

set :deploy_to, '/home/deployer/usagle'
set :deploy_user, 'deployer'

set :linked_files, %w[config/database.yml .env.production]

set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads]

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end

namespace :rails do
  desc 'Open the rails console on one remote server'
  task :console, roles: :app do
    hostname = find_servers_for_task(current_task).first
    port = exists?(:port) ? fetch(:port) : 22
    exec "ssh -l #{user} #{hostname} -p #{port} -t 'source ~/.profile && #{current_path}/script/rails c #{rails_env}'"
  end
end
