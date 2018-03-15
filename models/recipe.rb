class Recipe < ActiveRecord::Base

  validates :name, presence: true
  validates :desc, presence: true
  validates :chef, presence: true
  has_and_belongs_to_many :categories
  has_many :recipes_ingredients_usages
  has_many :ingredients, through: :recipes_ingredients_usages
  accepts_nested_attributes_for :recipes_ingredients_usages
  belongs_to :chef

end
