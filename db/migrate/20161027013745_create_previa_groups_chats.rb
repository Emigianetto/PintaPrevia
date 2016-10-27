class CreatePreviaGroupsChats < ActiveRecord::Migration[5.0]
  def change
    create_table :previa_groups_chats, id: false do |t|
      t.belongs_to :chat, index: true
      t.belongs_to :previa_group, index: true
    end
  end
end
