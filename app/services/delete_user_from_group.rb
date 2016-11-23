class DeleteUserFromGroup

  def self.call(group, user)
    #group.invited_users << user
    user.update_attribute(:previa_groups, user.previa_groups.reject{ |g| g.id == group.id })

    #group.save
    user.save

    CreateNotification.call(user, "El usuario #{group.leader.first_name} te eliminó del grupo #{group.name}.")
  end

end