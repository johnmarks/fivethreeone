namespace :db do
  task :init => [:drop, :create, :migrate, :seed]
end