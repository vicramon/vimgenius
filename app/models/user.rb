class User < ActiveRecord::Base
  include Authem::User
  include Rails.application.routes.url_helpers

  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :levels
  has_and_belongs_to_many :commands

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

  def self.create_temporary
    user = User.create(password: 'password',
                       password_confirmation: 'password',
                       temporary: true,
                       email: random_email)
  end

  def saved?
    !self.temporary
  end

  private

  def self.random_email
    (0..50).map{ ('a'..'z').to_a[rand(26)] }.join + "@example.com"
  end


end
