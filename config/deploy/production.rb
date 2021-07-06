
set :stage, :production
set :branch, 'main'
set :repo_url, "git@github.com:tvcam/#{fetch(:application)}.git"
set :linked_files, fetch(:linked_files, []).push('db/production.sqlite3')
set :linked_files, fetch(:linked_files, []).push('config/credentials/production.key')

server '52.53.239.219', user: 'deployer', roles: %w{app web db}