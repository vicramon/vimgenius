class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Authem::ControllerSupport

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end


end
