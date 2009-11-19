class Distillery < ActiveRecord::Base
  attr_accessible :name
  has_many :expressions

  validates_presence_of :name
  validates_uniqueness_of :name
end

