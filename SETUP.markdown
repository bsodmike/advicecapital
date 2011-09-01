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