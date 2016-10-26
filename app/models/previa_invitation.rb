class PreviaInvitation < ApplicationRecord
  belongs_to :inviting_group, :class_name => 'PreviaGroup'
  belongs_to :invited_group, :class_name => 'PreviaGroup'
end
