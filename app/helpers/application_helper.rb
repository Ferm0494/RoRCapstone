module ApplicationHelper
  def profile_img?
    return true if current_user.avatar.attached?

    false
  end
end
