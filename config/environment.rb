require File.expand_path('../boot', __FILE__)
env = ENV["SCARLET_ENV"] ||= "development"
Bundler.require(:default , env )
dbconfig = YAML.load(open("./config/database.yml"))
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection dbconfig[env]
require_all "app"
