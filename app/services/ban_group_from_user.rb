class BanGroupFromUser

  def self.call(user, previa_group)
    user.banned_groups << previa_group
    user.save

    CreateNotification.call(previa_group.leader, "El usuario #{user.first_name} bloqueó al grupo #{previa_group.name}.")
  end

end