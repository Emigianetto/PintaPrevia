class CreatePreviaGroups < ActiveRecord::Migration
  def change
    create_table :previa_groups do |t|
      t.string :name
      t.boolean :active
      t.datetime :date
      t.belongs_to :leader, :class_name => 'User', index: true

      t.timestamps null: false
    end
  end
end
