class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index 
  end 

  get '/recipes/new' do 
    erb :new 
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 

  post '/recipes' do 
    recipe = Recipe.new(params)

    if recipe.save 
      redirect to "/recipes/#{recipe.id}"
    else 
      redirect to "recipes/new"
    end 
  
  end 

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit 
  end 

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    params.delete("_method")
        if @recipe.update(params)
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "recipes/new"
        end
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
    
end
  





