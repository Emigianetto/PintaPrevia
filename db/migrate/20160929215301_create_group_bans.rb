class CreateGroupBans < ActiveRecord::Migration
  def change
    create_table :group_bans do |t|
      t.belongs_to :banning_group, :class_name => 'PreviaGroup' , index: true
      t.belongs_to :banned_group, :class_name => 'PreviaGroup' , index: true
    end
  end
end
