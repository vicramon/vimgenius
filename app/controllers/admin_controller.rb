class AdminController < ApplicationController
  before_filter :authenticate_admin, except: :login

  def authenticate_admin
    redirect_to admin_login_path unless cookies[:admin] == ENV.fetch("ADMIN_PASSWORD")
  end

  def login
    if request.post?
      if params[:password] == "vimmaster"
        cookies[:admin] = "vimmaster"
        redirect_to admin_root_path and return
      end
    end
  end

end
