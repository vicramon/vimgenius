class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :create_temp_user

  include Authem::ControllerSupport

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def create_temp_user
    unless signed_in?
      sign_in(User.create_temporary)
    end
  end


end
