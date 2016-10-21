class GetGroupsLeading

  def self.call(user)
    groups_leading = user.previa_groups.reject{ |pg| pg.leader != user }
  end

end