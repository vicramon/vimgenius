module ApplicationHelper

  def level_class_selector(params, level)
    if params[:lesson_id]
      lesson = Lesson.find_by_slug(params[:lesson_id])
      page_level = lesson.levels.find_by_slug(params[:id])
    end
    if page_level == level
      "active"
    elsif page_level && page_level.sequence_number > level.sequence_number
      "complete"
    end
  end

  def left_half(array)
    split_array_in_half(array).first
  end

  def right_half(array)
    split_array_in_half(array).second
  end

  private

  def split_array_in_half(array)
    array.each_slice((array.size/2.0).round).to_a
  end


end
