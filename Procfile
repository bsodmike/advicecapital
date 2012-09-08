web:     bundle exec thin start -p $PORT -e $RACK_ENV
worker:  QUEUE=* bundle exec rake resque:work
clock:   bundle exec clockwork config/clock.rb