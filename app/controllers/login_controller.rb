class LoginController < ApplicationController

  def create
    user = User.where(email: params[:email]).first_or_create do |user|
      user.email = params[:email]
      user.password = "password"
      user.password_confirmation = "password"
    end
    sign_in(user)
    redirect_to root_path
  end

  def destroy
    sign_out()
    redirect_to root_path
  end

end
