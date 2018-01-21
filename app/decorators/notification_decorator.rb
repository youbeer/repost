module NotificationDecorator
  def content
    case notifiable_type
    when 'Comment'
      "#{comment.user.name_with_default} commented on your #{comment.post.posted_on}'s post"
    end
  end

  def image
    case notifiable_type
    when 'Comment'
      comment.user.avatar_with_default
    end
  end

  def url
    case notifiable_type
    when 'Comment'
      comment.post
    end
  end
end