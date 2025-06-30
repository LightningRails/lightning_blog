module LightningBlog
  module Admin
    class PostsController < Admin::ApplicationController
      before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_published]
      
      def index
        @posts = Post.includes(:category).order(created_at: :desc)
        @posts = @posts.where('title ILIKE ?', "%#{params[:search]}%") if params[:search].present?
        @posts = @posts.where(category: params[:category_id]) if params[:category_id].present?
        @posts = @posts.where(published: params[:status] == 'published') if params[:status].in?(['published', 'draft'])
        @posts = @posts.page(params[:page])
        
        @categories = Category.order(:name)
      end
      
      def show
      end
      
      def new
        @post = Post.new
        @categories = Category.order(:name)
      end
      
      def create
        @post = Post.new(post_params)
        @categories = Category.order(:name)
        
        if @post.save
          redirect_to [:admin, @post], notice: 'Post was successfully created.'
        else
          render :new
        end
      end
      
      def edit
        @categories = Category.order(:name)
      end
      
      def update
        if @post.update(post_params)
          redirect_to [:admin, @post], notice: 'Post was successfully updated.'
        else
          @categories = Category.order(:name)
          render :edit
        end
      end
      
      def destroy
        @post.destroy
        redirect_to admin_posts_path, notice: 'Post was successfully deleted.'
      end
      
      def toggle_published
        @post.update(published: !@post.published?)
        status = @post.published? ? 'published' : 'unpublished'
        redirect_to admin_posts_path, notice: "Post was successfully #{status}."
      end
      
      private
      
      def set_post
        @post = Post.find(params[:id])
      end
      
      def post_params
        params.require(:post).permit(:title, :slug, :excerpt, :content, :category_id, :published, :meta_title, :meta_description, :featured_image)
      end
    end
  end
end 