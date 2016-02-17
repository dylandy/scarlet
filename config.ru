# config.ru
require 'sinatra/base'
require "active_record"
require ::File.expand_path('../config/environment', __FILE__)

#use application controller as middle ware
use Rack::Static, :root => 'public', :urls => ["/images","/javascripts","/stylesheets"]
use IndexController
run ApplicationController

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end
#include route rules
#require ::File.expand_path('../config/routes', __FILE__)
map("/"){run IndexController}

run Sinatra::Application
