categories = [
  'indian',
  'persian',
  'italian',
  'chinese'
]

categories.each do |category|
  Category.create!(name: category)
end


@recipes = []

@gluten_free = Category.create!(name: 'Gluten Free')
@desserts = Category.create!(name: 'Desserts')
@mexican = Category.create!(name: 'Mexican')

@guest = Chef.create!(name: 'Guest', bio: 'Guest')
@zoe_tourle = Chef.create!(name: 'Zoe Tourle', bio: 'The most popular person at WGC, Zoe makes a mean burrito and Key Lime Pie.', image: 'zoe_tourle.jpg')
@master_chief = Chef.create!(name: 'Master Chief', bio: 'After ridding Halo of the alien menace, his dsylexia kicked in and he ended up entering and winning Master Chef 3021.', image: 'master_chief.jpg')


@recipes << Recipe.create!(name: 'Brownies', desc:'Give ingredients to Zoe and wait 1 hour', categories: [@gluten_free, @desserts], chef: @zoe_tourle)
@recipes << Recipe.create!(name: 'Chilli', desc:'Add vegtables,mince and chilli, stir and eat', categories: [@mexican], chef: @master_chief)
@recipes << Recipe.create!(name: 'Chicken Soup', desc: 'Take away tasty stock cubes, boil chicken bones, serve', categories: [@gluten_free], chef: @zoe_tourle)

ingredients = [
  'carrots',
  'onion',
  'basil',
  'tomatoes',
  'potatoes'
]

ingredients.each do |ingredient|
  Ingredient.create!(name:ingredient)
end

@recipes[1].recipes_ingredients_usages[quanity: '200g']


