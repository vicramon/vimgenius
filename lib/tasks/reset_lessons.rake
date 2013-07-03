
task :reset_lessons => :environment do

  Rake::Task['destroy_lessons'].invoke
  Rake::Task['db:seed'].invoke

end
