#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
def load_rails_environment
  require File.expand_path('../config/application', __FILE__)
  require 'rake'
  Speedtest::Application.load_tasks
end

if ENV['LOAD_RAILS'] == '1'
  # Bypass these hacks that prevent the Rails environment loading, so that the
  # original descriptions and tasks can be seen, or to see other rake tasks provided
  # by gems.
  load_rails_environment
else
  # Create a stub task for all Rails provided tasks that will load the Rails
  # environment, which in will append the real definition of the task to
  # the end of the stub task, so it will be run directly afterwards.
  #
  # Refresh this list with:
  # LOAD_RAILS=1 rake -T | ruby -ne 'puts $_.split(/\s+/)[1]' | tail -n+2 | xargs
  %w(
    about db:create db:drop db:fixtures:load db:migrate db:migrate:status 
    db:rollback db:schema:dump db:schema:load db:seed db:setup 
    db:structure:dump db:version doc:app log:clear middleware notes 
    notes:custom rails:template rails:update routes secret stats test 
    test:recent test:uncommitted time:zones:all tmp:clear tmp:create
  ).each do |task_name|
    task task_name do
      load_rails_environment
      # Explicitly invoke the rails environment task so that all configuration
      # gets loaded before the actual task (appended on to this one) runs.
      Rake::Task['environment'].invoke
    end
  end

  # Create an empty task that will show up in rake -T, instructing how to
  # get a list of all the actual tasks. This isn't necessary but is a courtesy
  # to your future self.
  desc "!!! Default rails tasks are hidden, run with LOAD_RAILS=1 to reveal."
  task :rails
end

# Load all tasks defined in lib/tasks/*.rake
Dir[File.expand_path("../lib/tasks/", __FILE__) + '/*.rake'].each do |file|
  load file
end


#require File.expand_path('../config/application', __FILE__)

#Cerebrum::Application.load_tasks
