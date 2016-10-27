class GetInvitationsForUser

  def self.call(user)
    user.invitations
  end

end