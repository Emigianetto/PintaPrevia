class GetNotificationsForUser

  def self.call(user)
    # notifications = user.notifications.sort {|a,b| a.created_at <=> b.created_at }
    # user.notifications.desc(:created_at)
    sorted = user.notifications.sort_by &:created_at
    # user.notifications.order(created_at: :asc)
  end

end