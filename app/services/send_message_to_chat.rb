class SendMessageToChat

  def self.call(previa_group, chat, message)
    m = Message.new
    m.author = previa_group
    m.message = message
    m.chat = chat
    m.save
    m
  end

end