# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "lays-s2"
set :repo_url, "git@github.com-qbo:tvcam/#{fetch(:application)}.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, "/var/www/#{fetch(:application)}"
set :pty, false

set :rvm_ruby_version, '2.7.2@lays-s2'
set :rvm_roles, [:app, :web]
set :passenger_restart_with_touch, true

set :linked_dirs, fetch(:linked_dirs, []).push('public/qr_code', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')
