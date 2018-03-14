class Recipe < ActiveRecord::Base

  validates :name, presence: true
  validates :desc, presence: true
  has_and_belongs_to_many :categories
  belongs_to :chef

end
