require 'spec_helper'

RSpec.describe "/" do

    before do
      @categories = []
      @categories << Category.create!(name: 'Greek')
      @categories << Category.create!(name: 'French')
      @categories << Category.create!(name: 'Mexican')
      @categories << Category.create!(name: 'Korean')
    end

  describe "GET /" do
    it "displays a list of selectable categories" do
      get "/"
      expect(last_response).to be_ok
      expect(last_response.body).to include @categories.last.name
      expect(last_response.body).to include @categories.first.name
    end
  end
end
