class AcceptGroupInvitation

  def self.call(user, previa_group)
    user.previa_groups << previa_group
    user.invitations = user.invitations.reject{ |i| i.id == previa_group.id }

    CreateNotification.call(previa_group.leader, "El usuario #{user.first_name} aceptó la invitación al grupo #{previa_group.name}.")

    user.save
  end

end