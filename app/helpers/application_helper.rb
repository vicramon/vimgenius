module ApplicationHelper

  def level_class_selector(params, level)
    page_level = Level.find_by_slug(params[:id])
    if page_level == level
      "active"
    elsif page_level && page_level.sequence_number > level.sequence_number
      "complete"
    end
  end


end
