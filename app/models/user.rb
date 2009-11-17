class User < ActiveRecord::Base
  attr_accessible :name, :password
  attr_accessor :password

  validates_presence_of :name

  def password
    @password
  end

  def password=(value)
    self.hashword = encrypt_password(value,generate_salt)
  end

private

  def encrypt_password(password,salt)
    Digest::SHA1.hexdigest(password + 'AngelsTake' + salt)
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
    return salt
  end

end

