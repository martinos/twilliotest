require 'rubygems'
require 'bundler/setup'

#Bundler::GemHelper.install_tasks
Bundler.require(:default, :development)
require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end
# 
# Rake::Task[:release].actions.clear
# task :release => :build do
#   puts "Command not supported. Please use gem inabox !!!"
# end
