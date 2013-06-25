class Admin::LevelsController < AdminController
  expose(:lesson) { Lesson.find_by_slug(params[:lesson_id]) }
  expose(:levels) { lesson.levels }
  expose(:level, attributes: :level_params, finder: :find_by_slug)

  def create
    if level.update_attributes(level_params)
      redirect_to edit_admin_lesson_level_path(lesson, level), notice: "Your changes have been saved."
      return
    else
      redirect_to new_admin_lesson_level_path, flash: { error: level.errors }
    end
  end

  def update
    level.update_attributes(level_params)
    redirect_to edit_admin_lesson_level_path(lesson, level), notice: 'Your changes have been saved.'
  end

  private

  def level_params
    params.require(:level).permit!
  end



end
