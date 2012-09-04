RAILS_ENV   = ENV['RAILS_ENV']  || "production"
RAILS_ROOT  = ENV['RAILS_ROOT'] || "/var/www/apps/advicecapital/current"
PID_DIR     = "#{RAILS_ROOT}/log"

God.pid_file_directory = "#{PID_DIR}"

God.watch do |w|
  w.name     = "ac"
  w.interval = 30.seconds
  w.env      = { "RAILS_ENV" => RAILS_ENV }
  w.dir      = "#{RAILS_ROOT}"

  w.start    = "bundle exec clockwork #{RAILS_ROOT}/config/clock.rb"
  w.stop     = "kill -QUIT `cat #{PID_DIR}/clockwork.pid`"
  w.restart  = "kill -QUIT `cat #{PID_DIR}/clockwork.pid` && bundle exec clockwork #{RAILS_ROOT}/config/clock.rb"
  w.log      = "#{RAILS_ROOT}/log/clockwork.log"

  w.keepalive

  w.start_grace = 10.seconds
  w.restart_grace = 10.seconds
  w.pid_file = "#{PID_DIR}/clockwork.pid"

  w.uid = 'deploy'
  w.gid = 'deploy'

  # clean pid files before start if necessary
  w.behavior(:clean_pid_file)

  # determine the state on startup
  w.transition(:init, { true => :up, false => :start }) do |on|
    on.condition(:process_running) do |c|
      c.running = true
    end
  end

  # determine when process has finished starting
  w.transition([:start, :restart], :up) do |on|
    on.condition(:process_running) do |c|
      c.running = true
    end

    # failsafe
    on.condition(:tries) do |c|
      c.times = 5
      c.transition = :start
      c.interval = 5.seconds
    end
  end

  # start if process is not running
  w.transition(:up, :start) do |on|
    on.condition(:process_exits)
  end

  # # restart if memory or cpu is too high
  # w.transition(:up, :restart) do |on|
  #   on.condition(:memory_usage) do |c|
  #     c.interval = 20
  #     c.above = 50.megabytes
  #     c.times = [3, 5]
  #   end
  #
  #   on.condition(:cpu_usage) do |c|
  #     c.interval = 10
  #     c.above = 10.percent
  #     c.times = [3, 5]
  #   end
  # end

  # lifecycle
  w.lifecycle do |on|
    on.condition(:flapping) do |c|
      c.to_state = [:start, :restart]
      c.times = 5
      c.within = 5.minute
      c.transition = :unmonitored
      c.retry_in = 10.minutes
      c.retry_times = 5
      c.retry_within = 2.hours
    end
  end

end

