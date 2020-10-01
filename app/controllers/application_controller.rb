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
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect to "/recipes/#{@recipe.id}"
  end

  patch "/recipes/:id" do
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