class Command < ActiveRecord::Base
  validates :keystroke, presence: true
  validates :name, presence: true
  validates :start_mode, presence: true
  belongs_to :level

  has_and_belongs_to_many :users

  MASTERY_NUMBER = 2

  START_MODES = ["Normal Mode", "Insert Mode", "Visual Mode", "Visual Block Mode", "Visual Line Mode"]

  def keystroke_split
    keystroke.split(//)
  end

  def lesson
    self.level.lesson
  end

  def keystroke_joined
    keystroke.gsub(" ",'')
  end

  def keystroke_pretty
    keystroke.gsub!('or',' or ')
    keystroke
  end

  def capital_start_mode
    "-- " + self.start_mode.upcase + " --" unless self.start_mode == "Normal Mode"
  end


end
