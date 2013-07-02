
task :destroy_lessons => :environment do

  Lesson.destroy_all
  Level.destroy_all
  Command.destroy_all
  UserLesson.destroy_all
  UserCommand.destroy_all

end
