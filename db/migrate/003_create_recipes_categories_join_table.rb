class CreateRecipesCategoriesJoinTable < ActiveRecord::Migration[5.1]
  def self.up
    create_join_table :recipes, :categories do |t|
      t.index :recipe_id
      t.index :category_id
    end
  end

  def self.down
    drop_table :recipes_categories
  end
end
