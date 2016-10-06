class CreatePreviaInvitations < ActiveRecord::Migration
  def change
    create_table :previa_invitations do |t|
      t.date :date
      t.belongs_to :previa_group, index: true

      t.timestamps null: false
    end
  end
end
