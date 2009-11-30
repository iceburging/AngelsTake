class Score < ActiveRecord::Base
  attr_accessible :value

  belongs_to :user
  belongs_to :expression

  validates_presence_of :value

  def weight
    s = user.ranked_scores
    n = s.length
    mid = (n.to_f/2.0)-0.5
    mid - s.index(self)
  end

end

