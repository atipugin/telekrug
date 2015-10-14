namespace :db do
  task :migrate do
    Sequel.extension(:migration)
    Sequel::Migrator.run(DB, ROOT.join('db', 'migrations'))
  end
end
