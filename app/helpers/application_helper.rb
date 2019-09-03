module ApplicationHelper
  def liked_by_user?(link_id)
    Like.where(user_id: current_user.id, link_id: link_id).any?
  end
end
