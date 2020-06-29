class ApplicationController < ActionController::Base
  helper_method :user_logged_in?, :current_user

  def sanitize_params_users
    params.require(:user).permit(:name)
  end

  def user_logged(user)
    session[:id] = user.id
    redirect_to root_path
  end

  def logged_in?
    return true unless session[:id].nil?

    false
  end

  def current_user
    User.find(session[:id])
  end

  def authenticate
    return if logged_in?

    redirect_to login_path
  end

  def redirect
    redirect_to root_path if logged_in?
  end
end
