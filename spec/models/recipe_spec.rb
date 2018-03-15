require 'spec_helper'

RSpec.describe Recipe do

  before do
    @chef = Chef.create(name: "Gaston")
    @recipe = Recipe.create!(name:'Stew', desc:'Zoe special', chef: @chef)
    @beef = Ingredient.create!(name: 'Beef')
    @tomatoes = Ingredient.create!(name: 'Tomatoes')
    @stock = Ingredient.create!(name: 'Stock')
    @beef_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @beef, quantity:'500g')
    @tomatoes_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @tomatoes, quantity:'400g')
    @stock_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @stock, quantity:'1 litre')
  end

  it 'should have ingredients related to it' do
    expect(@recipe.ingredients.length).to eq 3
  end

  it 'should accept nested attributes for its ingredients' do
    new_recipe = Recipe.create!(
      name: "Pasta",
      desc: "Yummy",
      chef: @chef,
      recipes_ingredients_usages: [
        {ingredient: @beef_usage, quantity: '1000g'},
        {ingredient: {name:"salt"}, quantity: "A pinch"}
      ]
    )
    expect(new_recipe.ingredients.length).to eq 2
  end
end
