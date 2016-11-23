class InviteUser

  def self.call(group, user)
    #group.invited_users << user
    user.update_attribute(:invitations, user.invitations << group)

    #group.save
    user.save

    CreateNotification.call(user, "El usuario #{group.leader.first_name} te invitó al grupo #{group.name}.")
  end

end