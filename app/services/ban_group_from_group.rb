class BanGroupFromGroup

  def self.call(banning_group, banned_group)
    banning_group.banned_groups << banned_group
    banning_group.save

    CreateNotification.call(banned_group.leader, "El grupo #{banning_group.name} bloqueó al grupo #{banned_group.name}.")
  end

end