require 'spec_helper'

RSpec.describe "CategoriesController" do

  describe "GET /" do
    before do
      @categories = []
      @categories << Category.create!(name: 'Greek')
      @categories << Category.create!(name: 'French')
      @categories << Category.create!(name: 'Mexican')
      @categories << Category.create!(name: 'Korean')
    end

    it "displays a list of selectable categories" do
      get "/"
      expect(last_response).to be_ok
      expect(last_response.body).to include @categories.last.name
      expect(last_response.body).to include @categories.first.name
    end
  end

  describe "GET /categories/:id" do
    before do
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
      end

    describe "GET /categories/:id/recipes" do
      it "displays a list of selectable recipes for the selected category" do
        get "/categories/#{@gluten_free.id}"
        expect(last_response).to be_ok
        expect(last_response.body).to include @recipes.last.name
        expect(last_response.body).to include @recipes.first.name
        expect(last_response.body).not_to include @recipes.second.name
      end
    end
  end
end



