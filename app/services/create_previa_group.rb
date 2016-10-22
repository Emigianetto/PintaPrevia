class CreatePreviaGroup

  def self.call(previa_group_params, user)
    previa_group = PreviaGroup.new(previa_group_params)

    previa_group.leader = user
    previa_group.active = false
    previa_group.date = Time.now.strftime "%Y/%m/%d %H:%M:%S"
    user.update_attribute(:previa_groups, user.previa_groups << previa_group)
    previa_group.save

    min_age_property = Property.find_by(name: 'min_age')
    max_age_property = Property.find_by(name: 'max_age')
    gender_property = Property.find_by(name: 'gender')
    distance_property = Property.find_by(name: 'distance')

    min_age_property = PreviaGroupProperty.new()
    min_age_property.property = Property.find_by(name: 'min_age')
    min_age_property.previa_group = previa_group
    min_age_property.value = previa_group_params[:search_min_age]
    min_age_property.save

    max_age_property = PreviaGroupProperty.new()
    max_age_property.property = Property.find_by(name: 'max_age')
    max_age_property.previa_group = previa_group
    max_age_property.value = previa_group_params[:search_max_age]
    max_age_property.save
    
    gender_property = PreviaGroupProperty.new()
    gender_property.property = Property.find_by(name: 'gender')
    gender_property.previa_group = previa_group
    gender_property.value = previa_group_params[:search_gender]
    gender_property.save

    distance_property = PreviaGroupProperty.new()
    distance_property.property = Property.find_by(name: 'distance')
    distance_property.previa_group = previa_group
    distance_property.value = previa_group_params[:search_distance]
    distance_property.save

    previa_group
  end

end