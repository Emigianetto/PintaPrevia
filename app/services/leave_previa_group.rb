class LeavePreviaGroup

  def self.call(user, previa_group)
    user.update_attribute(:previa_groups, user.previa_groups.reject{ |pg| pg.id == previa_group.id})

    if(previa_group.users.count == 0 or previa_group.leader == user)
      previa_group.delete

      previa_group.users.each do |u|
        CreateNotification.call(u, "El grupo #{previa_group.name} fue eliminado.")
      end
    else
      CreateNotification.call(previa_group.leader, "El usuario #{user.first_name} salió del grupo #{previa_group.name}.")
    end

    user.save
    previa_group.save
    previa_group
  end

end