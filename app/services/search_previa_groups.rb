class SearchPreviaGroups

  def self.call(previa_group)
    groups = PreviaGroup.all

    gender =  previa_group.previa_group_properties.select {|p| "gender" == p.property.name}[0]
    min_age =  previa_group.previa_group_properties.select {|p| "min_age" == p.property.name}[0]
    max_age =  previa_group.previa_group_properties.select {|p| "max_age" == p.property.name}[0]
    distance =  previa_group.previa_group_properties.select {|p| "distance" == p.property.name}[0]

    puts gender.value
    puts min_age.value
    puts max_age.value
    puts distance.value

    if( gender.value != 'Todos' )
      # groups.each do |gr|
        # puts "-----------------------"
        # puts gr.name
        # puts gr.gender
        # puts "-----------------------*"
      # end
      groups = groups.reject{ |g| g.gender != gender.value }
      # puts groups
      # puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC\n"
    end
    groups = groups.reject{ |g| g.min_age < min_age.value.to_i }
    # puts groups
    # puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD\n"
    groups = groups.reject{ |g| g.max_age > max_age.value.to_i }
    # puts groups
    # puts "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE\n"
    #groups = groups.reject{ |g| g.distance != distance.value} TODO calculo de distancia
    
    invitations = PreviaInvitation.where('inviting_group_id = ?', previa_group.id)
    invitations.each do |i|
        groups = groups.reject{ |g| i.invited_group.id == g.id}
    end
    groups = groups.reject{ |g| g.id == previa_group.id }
  end

end