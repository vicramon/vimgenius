class LoginController < ApplicationController

  def create
    user = User.where(email: params[:email]).first
    if user
      sign_out()
      sign_in(user)
    else
      current_user.email = params[:email]
      current_user.temporary = false
      current_user.save
    end

    render partial: 'shared/login'
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
