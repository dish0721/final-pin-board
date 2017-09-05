class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
  	  	added_attrs = [:email, :password, :dp, :password_confirmation, :remember_me]
    	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    	devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  
  	 	#devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
    	#devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
    	#devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email,:password, :current_password, :password_confirmation, :dp) }
    end
  
end
