class CreatePreviaGroupsUsers < ActiveRecord::Migration
  def change
    create_table :previa_groups_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :previa_group, index: true
    end
  end
end
