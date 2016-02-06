require "./config/environment"
require "sinatra/activerecord/rake"

namespace :db do
  task  :down do
    Rake::Task["db:rollback"].invoke
  end
  task :up do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end

task :environment do
  require "./config/environment"
end

desc "open console with models and all environments"
task :console => :environment do
  Pry.start
end
