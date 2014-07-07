class AdminController < ApplicationController
  before_filter :authenticate_admin, except: :login

  def authenticate_admin
    redirect_to admin_login_path unless cookies[:admin] == hashed_admin_password
  end

  def login
    if request.post?
      if params[:password] == admin_password
        cookies[:admin] = hashed_admin_password
        redirect_to admin_root_path and return
      end
    end
  end

  private

  def admin_password
    ENV.fetch("ADMIN_PASSWORD")
  end

  def hashed_admin_password
    Digest::SHA1.hexdigest admin_password
  end

end
