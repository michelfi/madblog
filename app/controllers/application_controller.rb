class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Pundit::Authorization

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
