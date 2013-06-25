class Level < ActiveRecord::Base
  belongs_to :lesson
  validates :name, presence: true
  validates :sequence_number, presence: true
  before_save :create_slug

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end

end
