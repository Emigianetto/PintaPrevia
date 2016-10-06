class CreateUserBans < ActiveRecord::Migration
  def change
    create_table :user_bans do |t|
      t.belongs_to :user, index: true
      t.belongs_to :previa_group, class_name: 'PreviaGroup', index: true
    end
  end
end
