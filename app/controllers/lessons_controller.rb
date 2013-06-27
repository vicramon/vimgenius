class LessonsController < ApplicationController
  expose(:lessons) { Lesson.all }
  expose(:lesson, finder: :find_by_slug)
  expose(:first_level) { lesson.levels.first }

end
