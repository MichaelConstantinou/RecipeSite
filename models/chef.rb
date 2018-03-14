class Chef < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :bio, presence: true
  has_many :recipes

end
