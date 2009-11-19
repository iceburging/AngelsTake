class Expression < ActiveRecord::Base
  attr_accessible :name

  has_many :scores
  belongs_to :distillery

  validates_presence_of :name
end

