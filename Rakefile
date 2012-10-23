require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/biblia'
  t.test_files = FileList['test/lib/biblia/*.rb']
  t.verbose = true
end

task :default => :test
