class RejectGroupInvitation

  def self.call(user, previa_group)
    user.invitations = user.invitations.reject{ |i| i.id == previa_group.id }

    user.save
  end

end