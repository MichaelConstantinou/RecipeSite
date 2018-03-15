RecipieSite::App.controllers :recipes do

  get :new do
      @new_recipe = Recipe.new
      render 'new'
   end

  get :index, :with => :recipe_id do
    @recipe = Recipe.find_by(id: params['recipe_id'])
    render 'display_recipe'
  end

  post :index do
    @new_recipe = Recipe.new(request.params['recipe'])
    @user = Chef.find(1)
    @new_recipe.chef = @user
    if @new_recipe.save
      redirect '/chefs/1'
    else
      render 'new'
    end
  end

  get :index, :with => :category_id do
    @recipes = Recipe.includes(:categories).where(categories: { id: params[:category_id] })
    # binding.pry
    render 'recipes'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end


end
