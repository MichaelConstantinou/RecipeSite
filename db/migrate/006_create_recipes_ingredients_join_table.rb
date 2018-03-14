class CreateRecipesIngredientsJoinTable < ActiveRecord::Migration[5.1]
  def self.up
      create_join_table :recipes, :ingredients do |t|
      t.index :recipe_id
      t.index :ingredient_id
  end

  def self.down
    drop_table :recipes_ingredients
  end
end
