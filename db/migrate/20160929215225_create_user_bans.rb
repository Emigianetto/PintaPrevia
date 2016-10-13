class CreateUserBans < ActiveRecord::Migration
  def change
    create_table :user_bans, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :previa_group, index: true
    end
  end
end
