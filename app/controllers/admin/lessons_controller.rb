class Admin::LessonsController < AdminController
  expose(:lessons) { Lesson.all }
  expose(:lesson, attributes: :lesson_params)
  expose(:levels) { lesson.levels }

  def create
    (redirect_to admin_lessons_path and return) if lesson.save
    redirect_to new_admin_lesson_path, flash: { error: lesson.errors }
  end

  def update
    lesson.update_attributes(lesson_params)
    redirect_to admin_lessons_path, notice: 'Your changes have been saved.'
  end

  private

  def lesson_params
    params.require(:lesson).permit!
  end

end
