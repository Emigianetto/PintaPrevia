class GetCurrentUsers

  def self.call(group)
    users = User.all
    users = users.reject{ |u| (!group.users.include?(u)) }
  end

end