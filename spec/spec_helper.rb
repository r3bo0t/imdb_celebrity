begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'imdb_celebrity'

Spec::Runner.configure do |config|
  config.before(:all){
    
  }
  config.after(:all){
    
  }
end