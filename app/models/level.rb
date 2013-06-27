class Level < ActiveRecord::Base
  belongs_to :lesson
  has_many :commands
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :sequence_number, presence: true
  before_save :create_slug

  default_scope -> { order("sequence_number asc") }

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    where(slug: slug).first
  end

  def next_level
    self.lesson.levels.where(sequence_number: self.sequence_number+1).first
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end

end
