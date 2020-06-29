class UsersController < ApplicationController
  before_action :authenticate, only: [:show]
  before_action :redirect, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(sanitize_params_users)
    user_logged(@user) if @user.save
  end

  def show; end

  def update
    current_user.update(sanitize_user)
    render :show
  end

  private

  def sanitize_user
    params.require(:user).permit(:avatar)
  end
end
