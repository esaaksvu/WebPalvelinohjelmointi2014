class Rating < ActiveRecord::Base
  belongs_to :beer
  
  def score
    read_attribute(:score)
  end
  
  def to_s
    "#{self.beer.name} #{self.score}"
  end
  
end
