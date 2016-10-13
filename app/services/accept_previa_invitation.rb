class AcceptPreviaInvitation

  def self.call(invited_group, previa_invitation)
    inviting_group = previa_invitation.inviting_group

    previa_invitation.destroy

    inviting_group.matched_groups << invited_group
    invited_group.matched_groups << inviting_group

    previa_invitation.save
    inviting_group.save
    invited_group.save
  end

end