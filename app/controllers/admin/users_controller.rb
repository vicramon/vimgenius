class Admin::UsersController < AdminController
  expose(:users) { User.all }
  expose(:user)

end
