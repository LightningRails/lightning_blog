LightningBlog::Engine.routes.draw do
  root 'posts#index'
  
  resources :posts, only: [:index, :show], path: '' do
    collection do
      get :search
    end
  end
  
  resources :categories, only: [:index]
  
  # SEO-friendly category routes
  get '/category/:id', to: 'categories#show', as: :category
end
