class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :authorize

  protected

  	def authorize
  		unless User.find_by(id: session[:user_id])
  			flash[:error] = "You must log in to access this."
  			redirect_to log_in_url
  		end
  	end

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
