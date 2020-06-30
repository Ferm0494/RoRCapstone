class LanguagesController < ApplicationController
  before_action :authenticate
  def index
    # @languages = Language.all.where(user: current_user).order(created_at: :desc)
    @languages = Language.user_langs(current_user)
  end

  def new
    @language = Language.new
  end

  def top
    # @languages = Language.all.where(user: current_user)
    @languages = Language.user_langs(current_user).includes(:frameworks).order("SUM('total_hours') desc")
    # @languages = Language.order_by_hours(@languages)
    # @languages = Language.joins(:frameworks).where(id: @languages).order(total_hours: :desc).distinct
    
   end

  def poblated
    @languages = Language.all.where(user: current_user)
    @languages = Language.joins(:frameworks).where(id: @languages).group('frameworks.id').order("count('frameworks.id') DESC").distinct
    # debugger
  end

  def create
    @language = current_user.languages.build(sanitize_params_lang)
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
