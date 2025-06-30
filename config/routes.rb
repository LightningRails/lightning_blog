LightningBlog::Engine.routes.draw do
  root 'posts#index'
  
  # Public routes
  resources :posts, only: [:index, :show], path: '' do
    collection do
      get :search
    end
  end
  
  # Categories with clean URLs
  resources :categories, only: [:index]
  get '/category/:id', to: 'categories#show', as: :category
  
  # Admin routes
  namespace :admin do
    root 'dashboard#index'
    
    resources :posts do
      member do
        patch :toggle_published
      end
    end
    
    resources :categories
  end
end
