module LightningBlog
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]
    
    def index
      @categories = Category.with_published_posts.order(:name)
    end
    
    def show
      @posts = @category.posts.published.recent.limit(10)
    end
    
    private
    
    def set_category
      @category = Category.find_by!(slug: params[:id])
    end
  end
end 