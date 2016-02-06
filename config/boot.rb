ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
# setup gem listed in the Gemfile
require "bundler/setup" 
