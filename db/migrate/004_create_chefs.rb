class CreateChefs < ActiveRecord::Migration[5.1]
  def self.up
    create_table :chefs do |t|
      t.string :name
      t.text :bio
      t.string :image
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :chefs
  end
end
