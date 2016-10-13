class CreatePreviaInvitations < ActiveRecord::Migration
  def change
    create_table :previa_invitations do |t|
      t.date :date
      t.belongs_to :inviting_group, :class_name => 'PreviaGroup', index: true
      t.belongs_to :invited_group, :class_name => 'PreviaGroup', index: true

      t.timestamps null: false
    end
  end
end
