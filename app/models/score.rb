class Score < ActiveRecord::Base
  attr_accessible :value

  belongs_to :user
  belongs_to :expression

  validates_presence_of :value
end

