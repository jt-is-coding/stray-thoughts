class ApplicationController < ActionController::Base
  include Pundit
  skip_forgery_protection

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, unless: [:devise_controller?]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :password])
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized

      if current_user == nil
        flash[:alert] = "You must be signed in to search!"
      else
        flash[:alert] = "You are not authorized to perform this action."
      end

      redirect_back fallback_location: root_url
    end
end
