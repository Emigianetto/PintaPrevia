class BanGroupFromGroup

  def self.call(banning_group, banned_group)
    banning_group.banned_groups << banned_group
    banning_group.save
  end

end