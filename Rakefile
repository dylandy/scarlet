require "./config/environment"
require "yaml"
require "sinatra/activerecord/rake"

namespace :db do
  task  :down do
    Rake::Task["db:rollback"].invoke
  end
  task :up do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
  desc "setting socket for mysql"
  task :config do
     config = YAML.load_file("#{Dir.pwd}/config/database.yml")
     location = `mysql_config --socket`.split("\n").first 
     config["default"]["socket"] = location
     STDOUT.print "mysql user name:"
     user_name = STDIN.gets.chomp
     config["default"]["username"] = user_name
     STDOUT.print "password for mysql user:"
     password = STDIN.noecho(&:gets).chomp
     puts ""
     config["default"]["password"] = password
     File.open("#{Dir.pwd}/config/database.yml", 'w') {|f| f.write config.to_yaml } 
  end
end

task :environment do
  require "./config/environment"
end

desc "open console with models and all environments"
task :console => :environment do
  Pry.start
end

