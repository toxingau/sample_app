class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

   # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  #Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
    	flash[:danger] = "User correct"
    	redirect_to(root_url)
    end 
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
