class CreateNotification

  def self.call(user, msg)
    notification = Notification.new()
    notification.user = user
    notification.readed = false
    notification.message = msg

    notification.save
  end

end