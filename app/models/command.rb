class Command < ActiveRecord::Base
  validates :keystroke, presence: true
  validates :name, presence: true
  belongs_to :level



end
