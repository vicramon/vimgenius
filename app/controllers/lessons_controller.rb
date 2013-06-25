class LessonsController < ApplicationController
  expose(:lessons) { Lesson.all }
  expose(:lesson, finder: :find_by_slug)

end
