class CreatePreviaGroupProperties < ActiveRecord::Migration
  def change
    create_table :previa_group_properties, id: false do |t|
      t.belongs_to :previa_group, class_name: 'PreviaGroup', :null => false
      t.belongs_to :property, class_name: 'Property', :null => false
    end
  end
end
