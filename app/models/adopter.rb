class Adopter < ActiveRecord::Base
  has_many :pets
  has_many :shelters, through: :pets
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def adopt pet
    if pet.adopted? == false
      pet.update(adopted?: true)
      pet.update(adopter_id: self.id)
    else
      "can't adopted a pet that's already been adopted"
    end
  end

  def fav_pet
    species = []
    self.pets.each do |pet|
      species << pet.species
    end
    species.tally.max_by {|key,value| value}[0]
  end

end
