server '54.248.37.95', user: 'test_user', roles: %w{app db web}
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/first_aws_rsa'],
                  forward_agent: true