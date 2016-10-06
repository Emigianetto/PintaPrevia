class GetInvitationsForUser

  def self.call(user)
    user = User.find(user.id)
    user.invitations
  end

end