class LanguagesController < ApplicationController
  def index
    @languages = Language.includes(current_user).all
  end

  def new
    @language = Language.new
  end

  def show
  end

  def top
  end

  def poblated 
  end

  def create
    
    @language = Language.new(sanitize_params_lang)
    @language.total_hours, @language.total_frameworks = 0,0
    @language.user = current_user
    # debugger;
    if @language.save
      redirect_to languages_index_path
    else
      render :new
    end
  end
private
  def sanitize_params_lang
    params.require(:language).permit(:name, :icon)
  end
end
