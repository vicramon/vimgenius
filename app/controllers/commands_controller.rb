class CommandsController < ApplicationController
  expose(:lesson) { Lesson.find_by_slug(params[:lesson_id]) }
  expose(:level) { lesson.levels.find_by_slug(params[:level_id]) }
  expose(:commands) { level.commands }
  expose(:command)
  expose(:next_command) { next_command }
  expose(:next_level) { level.next_level }
  expose(:question_number) { current_index+1 }

  def show

    complete = false

    if params[:mastered]
      User.save_command(command)
    end

    complete ? congrats : render partial: 'shared/command', status: 200

  end

  def congrats
    if signed_in?
      current_user.save_level(level)
    end
    render partial: 'shared/congrats', status: 200
  end

  private


  def next_command
    commands[next_index]
  end

  def current_index
    commands.index(command)
  end

  def next_index
    new_index = current_index + 1
    new_index < (commands.size) ? new_index : 0
  end

end
