RecipieSite::App.controllers :chefs do

  get :index, :map => '/chefs' do
    @chefs = Chef.all
    render 'chefs'
  end

  get :index, :with => :chef_id do
    @recipes = Recipe.where(chef_id: params[:chef_id])
    # binding.pry
    render 'recipes'
  end

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

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
