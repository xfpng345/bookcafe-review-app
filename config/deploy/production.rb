server '54.248.37.95', user: 'test_user', roles: %w{app db web}
set :ssh_options, auth_methods: ['publickey'],
                  keys: ["~/.ssh/id_rsa_41cedb362f1967ff6fdfeeea3d5da3f3"],
                  # keys: ["#{ENV.fetch('PRODUCTION_SSH_KEY')}"],
                  forward_agent: true