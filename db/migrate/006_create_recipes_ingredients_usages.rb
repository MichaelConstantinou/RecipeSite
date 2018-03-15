class CreateRecipesIngredientsUsages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :recipes_ingredients_usages do |t|
      t.references :recipe
      t.references :ingredient
      t.string :quantity
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :recipes_ingredients_usages
  end
end
