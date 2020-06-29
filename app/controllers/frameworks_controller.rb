class FrameworksController < ApplicationController

  def index
    @language = Language.find(params[:id])
    @frameworks = Framework.all.where(user_id: current_user)
  end

  def new
   end

  def show
   end

  def create
   end

  def update
   end

end
