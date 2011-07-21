set :application, "miimenu"
set :domain, "miimenu.com"
set :repository, "get@github.com:Rafe/miimenu.git"
set :deploy_to, "/home/apps/miimenu"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :deploy_via, :remote_cache
set :deploy_env, "development"
set :rails_env, "develpoment"
set :scm, :git
set :branch, "development"
set :scm_verbose, true
set :use_sudo, false

set :user, "apps"
set :group, "apps"

default_environment["PATH"] = "usr/local/bin:usr/bin"

namespace :deploy do
  desc "restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

desc "Create database.yml and asset package for development"
after("deploy:update_code") do
  db_config = "#{shared_path}/config/database.yml.local"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

