require 'capistrano/ext/multistage'
require 'bundler/capistrano' #using bundler with Capistrano

set :stages, %w(staging development)
set :default_stage, "development"
