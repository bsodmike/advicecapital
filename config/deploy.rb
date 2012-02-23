default_run_options[:pty] = true
set :repository,  "git@github.com:Znow/advicecapital.git"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"

set :deploy_via, :remote_cache

require "whenever/capistrano"
#set :whenever_command, "/usr/local/rvm/gems/ruby-1.9.3-p0/bin/whenever"

set :application, "advicecapital"
set :deploy_to , "/var/www/apps/#{application}"
set :user, "deploy"
set :use_sudo, true
set :admin_runner, "root"
set :runner, "deploy" 

role :web, "danielg.dk"                          # Your HTTP server, Apache/etc
role :app, "danielg.dk"                          # This may be the same as your `Web` server
role :db,  "danielg.dk", :primary => true        # This is where Rails migrations will run




#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
