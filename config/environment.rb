require File.expand_path('../boot', __FILE__)
env = ENV["SCARLET_ENV"] ||= "development"
Bundler.require(:default , env )

#check if database.yml exist or not then create the db connection 
if `ls ./config/`.split("\n").include? "database.yml" 
  dbconfig = YAML.load(open("./config/database.yml"))
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.establish_connection dbconfig[env]
else
  system("cp ./config/database.yml.example ./config/database.yml")
end
require_all "app"
