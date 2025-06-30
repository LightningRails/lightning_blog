LightningBlog::Engine.routes.draw do
  root 'posts#index'
  
  resources :posts, only: [:index, :show], path: '' do
    collection do
      get :search
    end
  end
  
  # Categories with clean URLs
  resources :categories, only: [:index]
  get '/category/:id', to: 'categories#show', as: :category
end
