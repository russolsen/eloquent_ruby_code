require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'pathname'

desc "Run all examples"
task :spec do |t|
  Dir['*_spec.rb'].sort.each do |f|
    puts "Spec'ing #{f}"
    sh "rspec -I . #{f}"
  end
end

task :init 

task :default => %w{init spec}

task :irb do
  sh "irb -I ."
end
