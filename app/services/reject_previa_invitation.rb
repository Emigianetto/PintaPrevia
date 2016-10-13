class RejectPreviaInvitation

  def self.call(invited_group, previa_invitation)
    inviting_group = previa_invitation.inviting_group

    previa_invitation.destroy

    previa_invitation.save
    inviting_group.save
    invited_group.save
  end

end