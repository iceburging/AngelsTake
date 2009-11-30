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

  #def high_score
  #  scores.map {|s| s.value}.max
  #end

  #def low_score
  #  scores.map {|s| s.value}.min
  #end

  #def average_score
  #  (scores.reduce(0) {|sum,score| sum + score.value}.to_f / scores.length).round(1)
  #end

  def ranked_scores
    scores.sort {|s1,s2| s1.value <=> s2.value}
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

