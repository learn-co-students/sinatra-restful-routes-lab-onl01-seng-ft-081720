class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
    # erb :new
  end

  patch "/recipes/:id" do
    # binding.pry
    @recipe = recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end
end
