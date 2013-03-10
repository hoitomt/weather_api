require 'rake/testtask'
require 'football_data'
require './application.rb'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/test*.rb"]
  t.verbose = true
end

namespace :db do

  task :configure do
    FootballData.configure do |config|
      config.db_path = settings.db_path
    end
  end

  namespace :football_data do
    desc "Populate the database using the football data gem"
    task :populate => :configure do
      FootballData.run
    end

    task :migrate => :configure do
      FootballData::RawGame.auto_migrate!
      FootballData::Game.auto_migrate!
      FootballData::Team.auto_migrate!
    end

    desc "Update the football data tables"
    task :update => :configure do
      FootballData::RawGame.auto_upgrade!
      FootballData::Game.auto_upgrade!
      FootballData::Team.auto_upgrade!
    end

    desc "Delete all football data"
    task :clear => :configure do
      FootballData::RawGame.destroy
      FootballData::Game.destroy
      FootballData::Team.destroy
    end

    desc "Seed the test database"
    task :seed => :configure do
      FootballData::Team.seed
    end

    desc "Set up the football data database"
    task :setup => [:migrate, :seed] do
    end
  end
end