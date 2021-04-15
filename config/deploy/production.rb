server '35.73.150.45', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yosuke/.ssh/id_rsa'
