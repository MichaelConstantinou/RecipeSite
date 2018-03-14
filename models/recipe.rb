class Recipe < ActiveRecord::Base

  validates :name, presence: true
  validates :desc, presence: true
  validates :chef, presence: true
  has_and_belongs_to_many :categories
  belongs_to :chef

  # before_validation :set_default_chef

  # def set_default_chef

  #   chef ||= Chef.find(1)
  # end

end
