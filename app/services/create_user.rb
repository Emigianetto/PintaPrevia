class CreateUser

  def self.call(user_params)

    user = User.new(user_params)
    user.save!

    user
  end

end