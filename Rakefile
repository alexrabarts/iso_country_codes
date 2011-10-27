require 'rake'
require './lib/iso_country_codes.rb'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'iso_country_codes'
    s.summary = %Q{
      Provides ISO 3166-1 country codes/names and ISO 4217 currencies.
    }
    s.email = "alexrabarts@gmail.com"
    s.homepage = "http://github.com/alexrabarts/iso_country_codes"
    s.description = "ISO country code and currency library"
    s.authors = ["alex"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test
