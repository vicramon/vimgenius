class User < ActiveRecord::Base
  include Authem::User
  validates :email, presence: true, uniqueness: true

end
