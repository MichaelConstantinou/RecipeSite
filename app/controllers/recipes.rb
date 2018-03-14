RecipieSite::App.controllers :recipes do

  get :new do
      @new_recipe = Recipe.new
      render 'new'
   end

  post :index do
    p request.params['recipe']
    @new_recipe = Recipe.new(request.params['recipe'])
    @user = Chef.find(1)
    @new_recipe.chef = @user
    if @new_recipe.save
      redirect '/chefs/1'
    else
      render 'new'
    end
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
