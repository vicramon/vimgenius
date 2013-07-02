class LevelsController < ApplicationController
  expose(:lesson) { Lesson.find_by_slug(params[:lesson_id]) }
  expose(:levels) { lesson.levels }
  expose(:level, attributes: :level_params, finder: :find_by_slug)
  expose(:commands)   { level.commands }
  expose(:command)      { commands.first }
  expose(:next_command) { commands.second }
  expose(:current_cycle) { 1 }
  expose(:next_level) { level.next_level }
  expose(:question_number) { 1 }

  def show
    commands = current_user.commands_remaining_for_level(level)

    if commands.empty?
      congrats
    else
      @command = commands.first
    end
  end

  def congrats
    @show_congrats = true
    render :show
  end

end
