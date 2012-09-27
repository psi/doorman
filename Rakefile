require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

desc "Start redis-server and the app in dev mode"
task :run do
  sh "foreman start"
end
