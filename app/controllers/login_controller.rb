class LoginController < ApplicationController

  def create

    # method to import completed stuff goes here

    new_user = false
    user = User.where(email: params[:email]).first_or_create do |user|
      user.email = params[:email]
      user.password = "password"
      user.password_confirmation = "password"
      new_user = true
    end
    sign_out()
    sign_in(user)

    render partial: 'shared/login'
    # redirect_to user.last_congrats_path, notice: flash_for_sign_in(new_user)

  end

  def destroy
    sign_out()
    redirect_to root_path
  end

  private

  def flash_for_sign_in(new_user)
    if new_user
      "Welcome to VimGenius. Your progress has been saved."
    else
      "Welcome back buddy. I like your persistence.\n\nHere's where you last left off."
    end
  end


end
