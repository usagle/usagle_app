role :app, %w[deployer@92.53.66.126]
role :web, %w[deployer@92.53.66.126]
role :db,  %w[deployer@92.53.66.126]

server '92.53.66.126', user: 'deploy', roles: %w{web app}, my_property: :my_value