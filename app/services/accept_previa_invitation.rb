class AcceptPreviaInvitation

  def self.call(invited_group, previa_invitation)
    inviting_group = previa_invitation.inviting_group

    previa_invitation.destroy

    inviting_group.matched_groups << invited_group
    invited_group.matched_groups << inviting_group

    chat = Chat.new
    chat.groups << inviting_group
    chat.groups << invited_group

    message = Message.new
    message.author = inviting_group
    message.message = "Nuevo grupo encontrado!"
    chat.messages << message

    message.save
    chat.save
    previa_invitation.save
    invited_group.save
  end

end