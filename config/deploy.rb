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

  desc 'Remote console'
  task :console do
    on roles(:app) do |h|
      run_interactively "bundle exec rails console #{fetch(:rails_env)}", h.user
    end
  end

  desc 'Remote dbconsole'
  task :dbconsole do
    on roles(:app) do |h|
      run_interactively "bundle exec rails dbconsole #{fetch(:rails_env)}", h.user
    end
  end

  def run_interactively(command, user)
    info "Running `#{command}` as #{user}@#{host}"
    exec %(ssh #{user}@#{host} -t "bash --login -c 'cd #{fetch(:deploy_to)}/current && #{command}'")
  end

  after :publishing, :restart
end
