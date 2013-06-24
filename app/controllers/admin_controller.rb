class AdminController < ApplicationController
  before_filter :authenticate_admin, except: :login

  def authenticate_admin
    redirect_to admin_login_path unless cookies[:admin] == "vimgenius"
  end

  def login
    if request.post?
      if params[:password] == "vimgenius"
        cookies[:admin] = "vimgenius"
        redirect_to admin_root_path and return
      end
    end
  end

end
