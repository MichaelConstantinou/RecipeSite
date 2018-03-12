class CreateRecipes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :recipes do |t|
      t.string :name
      t.text :desc
      t.string :image
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :recipes
  end
end
