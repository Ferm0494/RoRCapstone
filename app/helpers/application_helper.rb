module ApplicationHelper
  def profile_img?
    return true if current_user.avatar.attached?

    false
  end

  def num_languages(user)
    user.languages.where_not_others_ordered.count
  end

  def lang_sum_hours_frameworks(lang)
    lang.frameworks.sum(:total_hours)
  end

  def lang_frameworks_count(lang)
    lang.frameworks.count
  end

  def lang?(language)
    return true if language.nil?

    false
  end
end
