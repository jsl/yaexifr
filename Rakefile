require 'rake/testtask'
 
task :default => :test
 
Rake::TestTask.new do |t|
  t.libs << 'lib' << 'tests'
  t.test_files = FileList['tests/*_test.rb']
end