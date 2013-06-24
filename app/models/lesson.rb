class Lesson < ActiveRecord::Base
  has_many :levels

  validates :name, presence: true

end
