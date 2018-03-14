require 'spec_helper'
require 'pry'


RSpec.describe "ChefsController" do

 describe "GET /chefs/:id" do
    before do
        @recipes = []
        @zoe_tourle = Chef.create!(name: 'Zoe Tourle', bio: 'The most popular person at WGC, Zoe makes a mean burrito and Key Lime Pie.', image: 'zoe_tourle.jpg')
        @master_chief = Chef.create!(name: 'Master Chief', bio: 'After ridding Halo of the alien menace, his dsylexia kicked in and he ended up entering and winning Master Chef 3021.', image: 'master_chief.jpg')
        @recipes << Recipe.create!(name: "Zoe el la Brownies", desc:'Give ingredients to Zoe and wait 1 hour', chef: @zoe_tourle)
        @recipes << Recipe.create!(name: 'Cosmic Chilli', desc:'Add vegtables,mince and chilli, stir and eat.', chef: @master_chief)
        @recipes << Recipe.create!(name: 'West Country Chicken Soup', desc: 'Take away tasty stock cubes, boil chicken bones, serve', chef: @zoe_tourle)
         # binding.pry
      end


    describe "GET /chefs/:id/recipes" do
      it "displays a list of selectable recipes for the selected category" do
        get "/chefs/#{@zoe_tourle.id}"
        expect(last_response).to be_ok
        expect(last_response.body).to include @recipes.last.name
        expect(last_response.body).to include @recipes.first.name
        expect(last_response.body).not_to include @recipes.second.name
    end
  end
end
end