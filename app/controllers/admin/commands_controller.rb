class Admin::CommandsController < AdminController
  expose(:level) { Level.find_by_slug(params[:level_id]) }
  expose(:commands) { level.commands }
  expose(:command, attributes: :command_params)

  def create
    if command.update_attributes(command_params)
      redirect_to edit_admin_lesson_level_command_path(level.lesson, level, command), notice: "Your changes have been saved."
      return
    else
      redirect_to new_admin_lesson_level_command_path, flash: { error: command.errors }
    end
  end

  def update
    command.update_attributes(command_params)
    redirect_to edit_admin_lesson_level_command_path(level.lesson, level, command), notice: 'Your changes have been saved.'
  end

  private

  def command_params
    params.require(:command).permit!
  end
end
