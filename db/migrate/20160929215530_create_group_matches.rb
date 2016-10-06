class CreateGroupMatches < ActiveRecord::Migration
  def change
    create_table :group_matches do |t|
      t.belongs_to :inviter_group, :class_name => 'PreviaGroup' , index: true
      t.belongs_to :invited_group, :class_name => 'PreviaGroup' , index: true
    end
  end
end
