class GetNotificationsForUser

  def self.call(user)
    user.notifications
  end

end