class SessionsController < ApplicationController
  before_action :redirect, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(sanitize_params_users)
    if @user.nil?
      @user = User.new
      @user.errors.add(:name, 'Invalid username')
      render :new
    else
      user_logged(@user)
    end
  end

  def destroy
    session[:id]= nil
    redirect_to login_path
  end
end
