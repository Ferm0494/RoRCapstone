module ApplicationHelper
  def profile_img(size)
    if current_user.avatar.attached?
      return image_tag(current_user.avatar,
                       class: 'rounded-circle  animate__animated animate__fadeIn animate__slow',
                       size: size)
    end

    image_tag('unknown_user.jpeg', class: 'rounded-circle animate__animated animate__fadeIn ', size: size)
  end

  def num_languages(user)
    user.languages.where_not_others_ordered.count
  end

  def language_sum_hours_frameworks(lang)
    lang.frameworks.sum(:total_hours)
  end

  def lang_frameworks_count(language)
    language.frameworks.count
  end

  def active(action, comparer)
    return 'active' if comparer.eql?(action)
  end

  # rubocop: disable  Metrics/PerceivedComplexity
  def lang(language, res = false, action = nil)
    if language.nil? && !res
      [profile_img(100),
       link_to('Create a new Framework',
               framework_new_path('other'), class: 'btn btn-success')]
    elsif !language.nil? && !res
      [image_tag(language.icon,
                 class: 'rounded-circle align-self-center', size: 100),
       link_to('Add a new Frame/Lib',
               framework_new_path(language), class: 'btn btn-success')]

    elsif !language.nil? && res

      [link_to('Most recents', index_frameworks_path(language),
               class: "nav-link btn btn-outline-success px-4 #{active(action, 'index')} "),
       link_to('Most hours', top_frameworks_path(language),
               class: "nav-link btn btn-outline-success px-4 #{active(action, 'top')}")]

    else

      [link_to('Most recents', all_frameworks_path,
               class: "nav-link btn btn-outline-success px-4 #{active(action, 'index2')} "),
       link_to('Most hours', top_overall_path,
               class: "nav-link btn btn-outline-success px-4 #{active(action, 'top2')}")]
    end
  end
  # rubocop: enable Metrics/PerceivedComplexity

  def language_get_params(language, lang)
    language.nil? ? lang.language : language
  end

  def get_title(language)
    !language.nil? ? "#{language.name} Programming" : 'Frameworks'
  end
end
