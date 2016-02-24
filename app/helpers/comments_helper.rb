module CommentsHelper

  def author(comment)
    user = User.where(id: comment.user_id)
    "#{user.first.first_name}" "#{user.first.last_name}"
  end


end
