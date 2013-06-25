class Lesson < ActiveRecord::Base
  has_many :levels
  before_save :create_slug
  validates :name, presence: true

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    where(slug: slug).first
  end

  def levels
    Level.where(lesson_id: self.id).order('sequence_number asc')
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end

end
