module LightningBlog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    def index
      @posts = Post.published.includes(:category).recent
      @posts = @posts.by_category(Category.find_by(slug: params[:category])) if params[:category].present?
      @posts = @posts.search(params[:search]) if params[:search].present?
      @posts = @posts.limit(10)
      
      @categories = Category.with_published_posts.order(:name)
    end
    
    def show
      @post.increment_views!
      @related_posts = Post.published
                           .where.not(id: @post.id)
                           .where(category: @post.category)
                           .recent
                           .limit(3)
    end
    
    private
    
    def set_post
      @post = Post.published.find_by!(slug: params[:id])
    end
  end
end 