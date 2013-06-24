class Admin::LevelsController < AdminController
  expose(:levels) { Level.where(lesson_id: params[:lesson_id]) }
  expose(:level)



end
