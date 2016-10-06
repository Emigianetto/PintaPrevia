class InviteUser

  def self.call(group, user)
    #group.invited_users << user
    user.invitations << group

    #group.save
    user.save
  end

end