class GetInvitableUsers

  def self.call(group)
    users = User.all
    users = users.reject{ |u| (u.id == group.leader_id or group.users.include?(u) or users.banned_groups.include?(group)) }
  end

end