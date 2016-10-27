class InviteUser

  def self.call(group, user)
    #group.invited_users << user
    user.update_attribute(:invitations, user.invitations << group)

    #group.save
    user.save
  end

end