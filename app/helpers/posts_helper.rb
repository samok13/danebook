module PostsHelper

  def like_status(post)
    if current_user
      if post.likes.pluck(:user_id).include? current_user.id
        link_to("Unlike", user_post_like_path(user_id: current_user.id, post_id: post_id, id: post.likes.where(user_id: current_user.id).first.id), method: :delete)
      else
        link_to("Like", user_post_likes_path(:like => { user_id: current_user.id, likeable_id: post.id, likeable_type: post.class.name, post_id: post.id }, post_id: post.id, method: :post))
          #do I need the method: :post here?
      end
    end
  end

end

