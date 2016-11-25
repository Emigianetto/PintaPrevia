class RejectGroupInvitation

  def self.call(user, previa_group)
    user.invitations = user.invitations.reject{ |i| i.id == previa_group.id }

    user.save

    CreateNotification.call(previa_group.leader, "El usuario #{user.first_name} rechazó la invitacion al grupo #{previa_group.name}.")
  end

end