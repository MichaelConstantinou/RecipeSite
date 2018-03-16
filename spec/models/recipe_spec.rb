require 'spec_helper'

RSpec.describe Recipe do

  before do
    @chef = Chef.create!(name: "Gaston", bio: 'He is quite the chef')
    @recipe = Recipe.create!(name:'Stew', desc:'Zoe special', chef: @chef)
    @beef = Ingredient.create!(name: 'Beef')
    @tomatoes = Ingredient.create!(name: 'Tomatoes')
    @stock = Ingredient.create!(name: 'Stock')
    @beef_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @beef, quantity:'500g')
    @tomatoes_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @tomatoes, quantity:'400g')
    @stock_usage = RecipesIngredientsUsage.create!(recipe: @recipe, ingredient: @stock, quantity:'1 litre')
    # binding.pry
  end

  it 'should have ingredients related to it' do
    expect(@recipe.ingredients.length).to eq 3
  end

  it 'should accept nested attributes for its ingredients' do
    new_recipe = Recipe.create!(
      name: "Pasta",
      desc: "Yummy",
      chef: @chef,
      recipes_ingredients_usages_attributes: [
        {ingredient: @beef, quantity: '1000g'},
        {ingredient: @tomatoes, quantity: '2'}
      ]
    )
    expect(new_recipe.ingredients.length).to eq 2
  end

  it 'should be able to access nested ingredients with quantities from recipe' do
    ingredient_1 = Ingredient.find_by(id: @recipe.recipes_ingredients_usages.first)
    expect(ingredient_1.name).to eq 'Beef'
    expect(@recipe.recipes_ingredients_usages.second.ingredient_id).to eq @tomatoes.id
    expect(@recipe.recipes_ingredients_usages.third.ingredient_id).to eq @stock.id
  end

  it 'should be able to update quantity of nested ingredient in recipe' do
    @recipe.recipes_ingredients_usages.second.update_attribute(:quantity, '5')
    expect(@recipe.recipes_ingredients_usages.second.quantity).to eq '5'
    binding.pry
  end
end
