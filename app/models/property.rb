class Property < ActiveRecord::Base
  has_many :previa_group_properties
  has_many :previa_groups, :through => :previa_group_properties
end
