class CommandsController < ApplicationController
  expose(:lesson) { Lesson.find_by_slug(params[:lesson_id]) }
  expose(:level) { lesson.levels.find_by_slug(params[:level_id]) }
  expose(:commands) { level.commands }
  expose(:command)

  expose(:next_level) { level.next_level }

  def show
    save_command_if_completed_on_time
    commands = current_user.commands_remaining_for_level(level)
    if commands.empty?
      congrats
    else
      @command = commands.shuffle.first
      render(partial: 'shared/command')
    end
  end

  def congrats
    if signed_in?
      current_user.save_level(level)
    end
    render partial: 'shared/congrats', status: 200
  end

  private

  def save_command_if_completed_on_time
    current_user.save_command(command) if params[:mastered]
  end



end
