class Message < ApplicationRecord
  belongs_to :author, :class_name => 'PreviaGroup'
  belongs_to :chat, :class_name => 'Chat'
end
