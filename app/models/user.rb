class User < ActiveRecord::Base
  include Authem::User
  include Rails.application.routes.url_helpers

  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :levels

  def save_level(level)
    self.levels << level unless self.levels.include?(level)
  end

  def last_congrats_path
    level = self.levels.last
    if level
      congrats_lesson_level_path(level.lesson, level)
    else
      root_path
    end
  end


end
