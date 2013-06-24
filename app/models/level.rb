class Level < ActiveRecord::Base
  belongs_to :lesson

  validates :name, presence: true
  validates :sequence_number, presence: true

end
