current_path = "/var/www/apps/advicecapital/current"

before_exec do |server|
	ENV['BUNDLE_GEMFILE'] = "#{current_path}/Gemfile"
end

# Set your full path to application.
APP_PATH = "/var/www/apps/advicecapital/current"
working_directory APP_PATH # available in 0.94.0+

# Set unicorn options
worker_processes 4
preload_app true
timeout 180
listen "127.0.0.1:9000"

# Spawn unicorn master worker for user deploy (group: apps)
user 'deploy', 'deploy'

# Should be 'production' by default, otherwise use other env
rails_env = ENV['RAILS_ENV'] || 'production'

# Log everything to one file
#stderr_path "log/unicorn.log"
#stdout_path "log/unicorn.log"

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stdout.log"

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.pid"

before_fork do |server, worker|
	ActiveRecord::Base.connection.disconnect!

	old_pid = "#{server.config[:pid]}.oldbin"
	if File.exists?(old_pid) && server.pid != old_pid
		begin
			Process.kill("QUIT", File.read(old_pid).to_i)
		rescue Errno::ENOENT, Errno::ESRCH
			# someone else did our job for us
		end
	end
end

after_fork do |server, worker|
	ActiveRecord::Base.establish_connection
end


