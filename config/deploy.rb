default_run_options[:pty] = true
set :repository,  "git@github.com:Znow/advicecapital.git"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"

set :deploy_via, :remote_cache

set :application, "advicecapital"
set :deploy_to , "/var/www/apps/#{application}"
set :user, "deploy"
set :use_sudo, true
set :admin_runner, "root"

#set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"

role :web, "znow.dk"                          # Your HTTP server, Apache/etc
role :app, "znow.dk"                          # This may be the same as your `Web` server
role :db,  "znow.dk", :primary => true        # This is where Rails migrations will run


require 'capistrano-unicorn'

#If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
   #task :start do ; end
   #task :stop do ; end
   #task :restart, :roles => :app, :except => { :no_release => true } do
     #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   #end
#end
