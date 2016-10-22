class FinishPreviaGroup

  def self.call(previa_group)
    previa_group.update_attribute(:active, true)
    previa_group.save
    previa_group
  end

end