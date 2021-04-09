# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

# formats ruby code with ruby/prettier gem. Takes a folder name as argument within brackets []
# example: 'rake priti[<folder_name_under_buggernaut-backend>]'

desc "prettier for ruby"
task :priti, [:option] => [:environment] do |task, args|
        sh "bundle exec rbprettier --write #{args[:option]}"
        puts "*** COMPLETE Formatted #{args[:option]} folder ***"
    end
