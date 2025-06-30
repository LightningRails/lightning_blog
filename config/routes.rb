LightningBlog::Engine.routes.draw do
  root 'posts#index'
  
  resources :posts, only: [:index, :show], path: '' do
    collection do
      get :search
    end
  end
  
  resources :categories, only: [:index, :show]
  
  # SEO-friendly category routes
  get '/category/:id', to: 'categories#show', as: :category
  get '/categories', to: 'categories#index'
end
