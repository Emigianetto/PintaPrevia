class PreviaGroup < ActiveRecord::Base
  belongs_to :leader, :class_name => 'User'

  has_many :previa_group_properties
  has_many :properties, :through => :previa_group_properties

  #has_many :previa_groups_users
  #has_many :users, through: :previa_groups_users, :class_name => 'User'
  has_and_belongs_to_many :users, :class_name=>'User', :join_table => 'previa_groups_users', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'
  #has_and_belongs_to_many :users

  has_and_belongs_to_many :invited_users, :class_name=>'User', :join_table => 'user_invitations', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'

  has_and_belongs_to_many :banned_users, :class_name=>'User', :join_table => 'user_bans', :foreign_key => 'previa_group_id', :association_foreign_key => 'user_id'
  
  has_and_belongs_to_many :banned_groups, :class_name=>'PreviaGroup', :join_table => 'group_bans', :foreign_key => 'banning_group_id', :association_foreign_key => 'banned_group_id'

  has_and_belongs_to_many :matched_groups, :class_name=>'PreviaGroup', :join_table => 'group_matches', :foreign_key => 'inviter_group_id', :association_foreign_key => 'invited_group_id'
  
  has_many :previa_invitations

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
    ans = "A"
    if (counts.length == 1)
      ans = counts.first.first.first
    end
    ans
  end
end
