class Recipe < ActiveRecord::Base

validates :name, presence: true
validates :desc, presence: true
has_many :categories

end
