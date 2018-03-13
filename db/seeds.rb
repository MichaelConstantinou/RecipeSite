categories = [
  'indian',
  'persian',
  'italian',
  'chinese'
]

@recipes = []
        @gluten_free = Category.create!(name: 'Gluten Free')
        @desserts = Category.create!(name: 'Desserts')
        @mexican = Category.create!(name: 'Mexican')
        @recipes << Recipe.create!(name: 'Brownies', desc:'Give ingredients to Zoe and wait 1 hour', categories: [@gluten_free, @desserts])
        @recipes << Recipe.create!(name: 'Chilli', desc:'Add vegtables,mince and chilli, stir and eat', categories: [@mexican])
        @recipes << Recipe.create!(name: 'Chicken Soup', desc: 'Take away tasty stock cubes, boil chicken bones, serve', categories: [@gluten_free])


categories.each do |category|
  Category.create!(name: category)
end