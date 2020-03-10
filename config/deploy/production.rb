role :app, %w{deployer@193.124.181.128}
role :web, %w{deployer@193.124.181.128}
role :db,  %w{deployer@193.124.181.128}

set :rails_env, :production
set :stage, :production

server '193.124.181.128', user: 'deployer', roles: %w{web app db}, primary: true

set :ssh_options, {
   keys: %w(/home/f1/.ssh/id_rsa /home/stepan/.ssh/id_rsa),
   forward_agent: true,
   auth_methods: %w(publickey password),
   port: 4422
}
