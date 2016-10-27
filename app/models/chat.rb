class Chat < ApplicationRecord

  has_many :messages
  has_and_belongs_to_many :groups, :class_name =>'PreviaGroup', :join_table => 'previa_groups_chats', :foreign_key => 'chat_id', :association_foreign_key => 'previa_group_id'

  def with(group)
    group = groups.reject{ |g| g == group }
  end
end
