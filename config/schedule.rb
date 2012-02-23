MAILTO=your@email.com

set :output, "#{path}/log/cron.log"

every 30.minutes do
  rake "stock_info_update"
end