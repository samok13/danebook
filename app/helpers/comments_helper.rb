module CommentsHelper

  def like_status(comment)
    if current_user
      if comment.likes.pluck(:user_id).include? current_user.id
        link_to("Unlike", user_comment_like_path(user_id: current_user.id, comment_id: comment_id, id: comment.likes.where(user_id: current_user.id).first.id), method: :delete)
      else
        link_to("Like", user_comment_likes_path(:like => { user_id: current_user.id, likeable_id: comment.id, likeable_type: comment.class.name, comment_id: comment.id }, comment_id: comment.id, method: :post))
          #do I need the method: :post here?
      end
    end
  end

  def author(comment)
    user = User.where(id: comment.user_id)
    "#{user.first.first_name}" "#{user.first.last_name}"
  end


end
