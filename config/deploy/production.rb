role :app, %w[deployer@95.213.191.88]
role :web, %w[deployer@95.213.191.88]
role :db,  %w[deployer@95.213.191.88]

set :rails_env, :production
set :stage, :production

server '95.213.191.88', user: 'deployer', roles: %w[web app db], primary: true

set :ssh_options,
    keys: %w[/home/playrix/.ssh/id_rsa],
    forward_agent: true,
    auth_methods: %w[publickey password],
    port: 22
