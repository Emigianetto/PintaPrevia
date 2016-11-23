class DeleteNotification

  def self.call(user, notification)
    user.notifications = user.notifications.reject{ |n| n.id == notification.id }

    user.save
  end

end