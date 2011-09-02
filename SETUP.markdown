## Development Resque Config

These instructions are in reference to the following commits:

    (development)$ git lg
    * 357f79b cleaned up JS causing stock-slider to break; increased %li width in st
    * fe286fb upgraded to jQuery 1.6.2, added stock partial to index template; ystoc
    * e0abed5 added rake task to prep and re-init stock_data table, database updatin
    * 393221c created model to hold stock info, migration generated
    * 97bccc5 initial resque setup, worker fires on visiting root_path

### Setup - IMPORTANT!

* Install Redis as per the railscast (use homebrew)
* Run `bundle` to install the `Resque` gem.
* Run `rake db:migrate`
* Run `rake stock_table:setup`

> *IMPORTANT*
> The rake task will configure the table correctly, it does some important stuff.

* Start Redis: `redis-server /usr/local/etc/redis.conf`
* Start a worker: `rake resque:work QUEUE='*'`
* Start the web interface: 'resque-web'

### Foreman
02/09/2011

Run `bundle` to install the foreman gem.  A Procfile has been created to start Redis and a worker process as well.  To start, simply run `foreman start` and to enable multiple workers `foreman -c worker=2`.  

Here's some example output of foreman in action:

    18:08:46 redis.1   | [87228] 02 Sep 18:08:46 - 2 clients connected (0 slaves), 940672 bytes in use
    18:08:49 worker.1  | StockData updated at 09/02/11 @ 1808 +0300

