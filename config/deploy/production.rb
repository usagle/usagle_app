role :app, %w[deployer@92.53.66.126]
role :web, %w[deployer@92.53.66.126]
role :db,  %w[deployer@92.53.66.126]

set :rails_env, :production
set :stage, :production

server '92.53.66.126', user: 'deployer', roles: %w{web app db}, primary: true

set :ssh_options, {
   keys: %w[/home/playrix/.ssh/id_rsa],
   forward_agent: true,
   auth_methods: %w(publickey password),
   port: 22
}