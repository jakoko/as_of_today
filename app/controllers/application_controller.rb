class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # Safety precaution to prevent basic hacks
  def authorized?
  	if (session[:user_id] == nil) || (params[:user_id] != session[:user_id])
  		redirect_to home_path
  	end
  end

  def authorized_portfolio_actions?
    if (session[:user_id] == nil) || (params[:portfolio][:user_id] != session[:user_id])
      redirect_to home_path
    end
  end

  # Method is used to prevent logged-in users from
  # creating another account
  def users_controller_banned_actions
  	redirect_to home_path if logged_in? # from SessionsHelper Module
  end

end
