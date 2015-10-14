require File.expand_path('../app.rb', __FILE__)
require 'rubocop/rake_task'

Rake.add_rakelib('lib/tasks')

RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = false
  task.patterns = %w(app.rb app/**/*.rb)
end

task default: %w(rubocop)
