class AuthenticateUser

  def self.call(user_email, pass)
    user = User.find_by(email: user_email, pass: pass)
  end

end