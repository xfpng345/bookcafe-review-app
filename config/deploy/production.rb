server '54.248.37.95', user: 'test_user', roles: %w{app db web}
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/key_book_cafe_review_app.pem'],
                  forward_agent: true