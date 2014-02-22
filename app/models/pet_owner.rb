class PetOwner < ActiveRecord::Base
  has_many :questions
end
