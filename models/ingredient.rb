class Ingredient < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_many :recipes, through:  :recipes_ingredients_usages
  has_many :recipes_ingredients_usages
  accepts_nested_attributes_for :recipes_ingredients_usages

end
