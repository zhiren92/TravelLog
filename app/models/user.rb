class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :summary, type: String
  field :password_digest, type: String

  def password=(unencrypted_password)
  	unless unencrypted_password.empty?
  		@password = unencrypted_password
  		self.password_digest = BCrypt::Password.create(unencrypted_password)
  	end
  end

  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  		return self
  	else
  		return flase
  	end
  end
end
