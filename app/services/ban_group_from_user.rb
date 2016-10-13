class BanGroupFromUser

  def self.call(user, previa_group)
    user.banned_groups << previa_group
    user.save
  end

end