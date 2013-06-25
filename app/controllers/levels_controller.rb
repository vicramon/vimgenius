class LevelsController < ApplicationController
  expose(:lesson) { Lesson.find_by_slug(params[:lesson_id]) }
  expose(:levels) { lesson.levels }
  expose(:level, attributes: :level_params, finder: :find_by_slug)
  expose(:commands) { level.commands }

  def show

  end

end
