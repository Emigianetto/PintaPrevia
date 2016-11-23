class RejectPreviaInvitation

  def self.call(invited_group, previa_invitation)
    inviting_group = previa_invitation.inviting_group

    previa_invitation.destroy

    previa_invitation.save
    inviting_group.save
    invited_group.save

    CreateNotification.call(inviting_group.leader, "El grupo #{invited_group.name} rechazó la invitacion a previa del grupo #{inviting_group.name}.")
  end

end