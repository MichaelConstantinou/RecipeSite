categories = [
  'indian',
  'persian',
  'italian',
  'chinese'
]

categories.each do |category|
  Category.create!(name: category)
end


recipes = []

@gluten_free = Category.create!(name: 'Gluten Free')
@desserts = Category.create!(name: 'Desserts')
@mexican = Category.create!(name: 'Mexican')

@guest = Chef.create!(name: 'Guest', bio: 'Guest')
@zoe_tourle = Chef.create!(name: 'Zoe Tourle', bio: 'The most popular person at WGC, Zoe makes a mean burrito and Key Lime Pie.', image: 'zoe_tourle.jpg')
@master_chief = Chef.create!(name: 'Master Chief', bio: 'After ridding Halo of the alien menace, his dsylexia kicked in and he ended up entering and winning Master Chef 3021.', image: 'master_chief.jpg')

ingredients = [
  'chocolate',
  'peas',
  'basil',
  'coconut milk'
]

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

@eggplant = Ingredient.create(name: 'eggplant')
@bell_pepper = Ingredient.create(name: 'bell pepper')
@carrot = Ingredient.create(name: 'carrot')
@tomato = Ingredient.create(name: 'tomato')
@oregano = Ingredient.create(name: 'oregano')
@chicken = Ingredient.create(name: 'chicken')


# recipes << Recipe.create!(
#   name: 'Brownies',
#   desc:'Give ingredients to Zoe and wait 1 hour',
#   categories: [@gluten_free, @desserts],
#   chef: @zoe_tourle,
#   recipes_ingredients_usages_attributes: [
#     {ingredient: 'chocolate' , quantity:'500g'},
#     {ingredient: 'coconut milk', quantity: '1 cup'}
#   ])

recipes << Recipe.create!(
  name: 'Chilli',
  desc:'Add vegtables,mince and chilli, stir and eat',
  categories: [@mexican],
  chef: @master_chief,
  recipes_ingredients_usages_attributes: [
    {ingredient: @eggplant, quantity: '1 small'},
    {ingredient: @bell_pepper, quantity: '2'},
    {ingredient: @tomato, quantity: '3'},
    {ingredient: @carrot, quantity: '3'}
])

recipes << Recipe.create!(
  name: 'Chicken Soup',
  desc: 'Take away tasty stock cubes, boil chicken bones, serve',
  categories: [@gluten_free],
  chef: @zoe_tourle,
  recipes_ingredients_usages_attributes: [
    {ingredient: @tomato, quantity: '5'},
    {ingredient: @oregano, quantity: '1 tbsp'},
    {ingredient: @chicken, quantity: 'bones'}
    ] )


