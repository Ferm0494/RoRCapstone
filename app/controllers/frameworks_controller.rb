class FrameworksController < ApplicationController
  before_action :authenticate
  before_action :defining_lang, except: %i[index2 top2]

  def index
    @frameworks = Framework.where(user_id: current_user, language_id: @language).order(updated_at: :desc)
  end

  def index2
    @frameworks = current_user.frameworks.order(updated_at: :desc).includes([:language])
  end

  def top2
    @frameworks = Framework.where(user_id: current_user).includes([:language]).order(total_hours: :desc)
  end

  def top
    @frameworks = Framework.where(user_id: current_user, language_id: @language).order(total_hours: :desc)
  end

  def new
    @framework = Framework.new
  end

  def edit
    @framework = Framework.where(user_id: current_user, language_id: @language, id: params[:id2]).first

    redirect_to languages_index_path if @framework.nil?
  end

  def create
    @framework = @language.frameworks.build(sanitize_params_frame)
    @framework.user = current_user
    @framework.total_hours = 0
    if @framework.save
      redirect_to index_frameworks_path
    else

      render :new
    end
  end

  def update
    framework = Framework.find(params[:id2])
    total_hours = framework.total_hours
    added_hours = params.require(:framework).permit(:total_hours)
    total_hours += added_hours[:total_hours].to_i

    framework.update(total_hours: total_hours)
    redirect_to index_frameworks_path(@language)
  end

  private

  def defining_lang
    if !params[:id].eql? 'other'
      @language = Language.where(user_id: current_user, id: params[:id]).first
      redirect_to languages_index_path if @language.nil?
    else
      @language = Language.user_langs(current_user).find_by(name: 'others')
      if @language.nil?
        create_new_others_register
        @language = Language.user_langs(current_user).find_by(name: 'others')
      end

    end
  end

  def create_new_others_register
    @language = current_user.languages.build(name: 'others')
    @language.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                          filename: 'other.png',
                          content_type: 'image/png')
    @language.save
  end

  def sanitize_params_frame
    params.require(:framework).permit(:name, :icon)
  end
end
