require 'rake/testtask'

task :default => :run_specs

Rake::TestTask.new do |t|
  t.name = "spec"
  t.pattern = "spec/*_spec.rb"
end

# Jacked a bunch of this Redis stuff from Ohm.
# https://github.com/soveran/ohm
REDIS_DIR = File.expand_path(File.dirname(__FILE__) + '/spec')
REDIS_CNF = File.join(REDIS_DIR, "test.conf")
REDIS_PID = File.join(REDIS_DIR, "db", "redis.pid")

desc "Run tests and manage server start/stop"
task :run_specs => ["redis:start", "spec", "redis:stop"]

namespace :redis do
  desc "Start the Redis server"
  task :start do
    unless File.exists?(REDIS_PID)
      system "redis-server #{REDIS_CNF}"
    end
  end

  desc "Stop the Redis server"
  task :stop do
    if File.exists?(REDIS_PID)
      system "kill #{File.read(REDIS_PID)}"
      File.delete(REDIS_PID)
    end
  end
end

desc "Start redis-server and the app in dev mode"
task :run do
  sh "foreman start"
end
