class CreatePreviaGroup

  def self.call(previa_group_params, user)
    previa_group = PreviaGroup.new(previa_group_params)
    previa_group.leader = user
    previa_group.users << user
    previa_group.save
    previa_group
  end

end