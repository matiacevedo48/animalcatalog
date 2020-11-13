class Cow < ApplicationRecord
  has_many :animals, as: :animalable

end
