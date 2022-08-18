class Pet < ActiveRecord::Base
  belongs_to :shelter
  belongs_to :adopter

  def self.oldest
    Pet.all.max_by {|pet| pet.age}
  end

  def self.average_age
    total_age = 0
    Pet.all.each do |pet|
      total_age += pet.age
    end
    total_age / Pet.all.length
  end

  def in_dog_years
    if self.species == "dog"
      self.age * 5
    else
      "can't count dog years if it's not a dog"
    end
  end

end
