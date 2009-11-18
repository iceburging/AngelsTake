class User < ActiveRecord::Base
  attr_accessible :name, :password, :email
  attr_accessor :password

  has_many :scores

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validate :password_not_blank

  def password
    @password
  end

  def password=(value)
    self.hashword = encrypt_password(value,generate_salt)
  end

private

  def password_not_blank
    errors.add_to_base("Password not present") if hashword.blank?
  end

  def encrypt_password(password,salt)
    Digest::SHA1.hexdigest(password + 'AngelsTake' + salt)
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
    return salt
  end

end

