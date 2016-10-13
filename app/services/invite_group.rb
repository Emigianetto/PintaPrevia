class InviteGroup

  def self.call(inviting_group, invited_group)
    previa_invitation = PreviaInvitation.new()
    previa_invitation.date = Date.today
    inviting_group.previa_invitations_sent << previa_invitation
    invited_group.previa_invitations_received << previa_invitation

    previa_invitation.save
    inviting_group.save
    invited_group.save
  end

end