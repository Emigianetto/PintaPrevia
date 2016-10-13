class CreatePreviaGroupProperties < ActiveRecord::Migration
  def change
    create_table :previa_group_properties, id: false do |t|
      t.belongs_to :previa_group, index: true
      t.belongs_to :property, index: true
      t.string :value
      t.timestamps null: false
    end
  end
end
