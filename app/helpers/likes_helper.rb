module LikesHelper

  def like_status(likeable)
    if current_user
      if like = likeable.likes.find_by_user_id(current_user.id)
        link_to("Unlike", like_path(like), method: :delete)
      else
        link_to("Like", likes_path(:like => { likeable_id: likeable.id, likeable_type: likeable.class.name }), method: :post)
      end
    end

  end

end
