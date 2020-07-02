class LanguagesController < ApplicationController
  before_action :authenticate
  def index
    @languages = Language.with_attached_icon.user_langs(current_user).where("name != 'others'").order(name: :desc)
  end

  def new
    @language = Language.new
  end

  def top
    @languages = Language.with_attached_icon.user_langs(current_user).where("name != 'others'")
    @languages = @languages.sort_by { |a| a.frameworks.sum(:total_hours) }.reverse
  end

  def poblated
    @languages = Language.with_attached_icon.where(user: current_user).where("name != 'others'")
    @languages = @languages.sort_by { |a| a.frameworks.count }.reverse
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
