class PreviaGroup < ApplicationRecord
  validates_presence_of :name, :date, :search_gender, :search_distance, :search_min_age, :search_max_age
  validates_uniqueness_of :name

  belongs_to :leader, :class_name => 'User'

  has_many :previa_group_properties
  has_many :properties, :through => :previa_group_properties

  has_many :messages
  
  has_and_belongs_to_many :chats, :class_name =>'Chat', :join_table => 'previa_groups_chats', :foreign_key => 'previa_group_id', :association_foreign_key => 'chat_id'

  #has_many :previa_groups_users
  #has_many :users, through: :previa_groups_users, :class_name => 'User'
  has_and_belongs_to_many :users, :class_name =>'User', :join_table => 'previa_groups_users', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'
  #has_and_belongs_to_many :users

  has_and_belongs_to_many :invited_users, :class_name =>'User', :join_table => 'user_invitations', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'

  has_and_belongs_to_many :banned_users, :class_name =>'User', :join_table => 'user_bans', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'
  
  has_and_belongs_to_many :banned_groups, :class_name =>'PreviaGroup', :join_table => 'group_bans', :foreign_key => 'banning_group_id', :association_foreign_key => 'banned_group_id'

  has_and_belongs_to_many :matched_groups, :class_name =>'PreviaGroup', :join_table => 'group_matches', :foreign_key => 'inviter_group_id', :association_foreign_key => 'invited_group_id'
  
  has_many :previa_invitations_sent, :class_name =>'PreviaInvitation', :foreign_key => 'inviting_group_id'
  has_many :previa_invitations_received, :class_name =>'PreviaInvitation', :foreign_key => 'invited_group_id'

  GENDER_TYPES = ["Masculino", "Femenino", "Todos"]

  attr_accessor :search_gender, :search_distance, :search_min_age, :search_max_age
=begin
  has_many :current_groups
  has_many :members, through: :current_groups, :class_name => 'User'

  has_many :user_invitations
  has_many :invited_users, through: :user_invitations, :class_name => 'User'

  has_many :user_bans
  has_many :banned_users, through: :user_bans, :class_name => 'User'

  has_many :group_bans
  has_many :banned_groups, through: :group_bans, :class_name => 'Group'

  has_many :group_matches
  has_many :matched_groups, through: :group_matches, :class_name => 'Group'
=end
  def search_gender
    prop = previa_group_properties.select{ |p| p.property.name == 'gender' }
    prop = prop.first
    if(prop.nil?)
      prop |= "Todos"
    else
      prop = prop.value
    end
  end

  def search_distance
    prop = previa_group_properties.select{ |p| p.property.name == 'distance' }
    prop = prop.first
    if(prop.nil?)
      prop |= "15"
    else
      prop = prop.value
    end
  end

  def search_min_age
    prop = previa_group_properties.select{ |p| p.property.name == 'min_age' }
    prop = prop.first
    if(prop.nil?)
      prop |= "18"
    else
      prop = prop.value
    end
  end

  def search_max_age
    prop = previa_group_properties.select{ |p| p.property.name == 'max_age' }
    prop = prop.first
    if(prop.nil?)
      prop |= "60"
    else
      prop = prop.value
    end
  end

  def min_age
    members = users
    min = members.min_by { |m| m.age}
    min.age
  end

  def max_age
    members = users
    max = members.max_by { |m| m.age}
    max.age
  end

  def gender
    members = users
    counts = Hash.new(0)
    members.each{ |m| counts[m.gender] += 1}
    ans = "Todos"
    if (counts.length == 1)
      ans = counts.first.first
    end
    ans
  end
end
