require "./config/environment"
require "yaml"
require "sinatra/activerecord/rake"

namespace :db do
  desc "setting socket for mysql"
  task :config do
     config = YAML.load_file("#{Dir.pwd}/config/database.yml")
     location = `mysql_config --socket`.chomp 
     config["default"]["socket"] = location
     config["development"]["socket"] = location
     config["test"]["socket"] = location
     config["production"]["socket"] = location
     STDOUT.print "mysql user name:"
     user_name = STDIN.gets.chomp
     config["default"]["username"] = user_name
     STDOUT.print "password for mysql user:"
     password = STDIN.noecho(&:gets).chomp
     puts ""
     config["default"]["password"] = password
     STDOUT.print "project database name:"
     project_db = STDIN.gets.chomp
     config["development"]["database"] = "#{project_db}_development"
     config["test"]["database"] = "#{project_db}_test"
     config["production"]["database"] = "#{project_db}_production"
     File.open("#{Dir.pwd}/config/database.yml", 'w+') {|f| f.write config.to_yaml } 
     system("rake db:create")
  end
end

desc "install scarlet cli commands"
task :install do
  #added alias to bashrc for automatically run scarlet cli interface
  if File.exist? File.expand_path("~/.bashrc") 
    unless File.readlines(File.expand_path("~/.bashrc")).grep(/scarlet\/bin\/scarlet/).any?
      File.open(File.expand_path("~/.bashrc") , "a+") do |f|
        f.puts("alias scarlet='ruby "+ "#{Dir.pwd}/bin/scarlet'")
      end
      system(". ~/.bashrc")
      puts "scarlet cli has just been installed! type 'scarlet --help' for more information."
    else
      puts "scarlet has been installed! type 'scarlet --help' for more information."
    end
  else
    File.open(File.expand_path("~/.bashrc") , "a+") do |f|
      f.puts("alias scarlet='ruby "+ "#{Dir.pwd}/bin/scarlet'")
    end
    system(". ~/.bashrc")
    puts "scarlet has just been installed! type 'scarlet --help' for more information."
  end
end

task :environment do
  require "./config/environment"
end

desc "open console with models and all environments"
task :console => :environment do
  Pry.start
end

