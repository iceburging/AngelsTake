class Expression < ActiveRecord::Base
  attr_accessible :name

  has_many :scores
  belongs_to :distillery

  validates_presence_of :name

  def weight
    scores.reduce(0) do |sum,score|
      sum + score.weight
    end
  end

  def rank
    ranked_expressions = Expression.find(:all).sort {|e1,e2| e1.weight <=> e2.weight}
    ranked_expressions.index(self)
  end
end

