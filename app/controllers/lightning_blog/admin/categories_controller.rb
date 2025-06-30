module LightningBlog
  module Admin
    class CategoriesController < Admin::ApplicationController
      before_action :set_category, only: [:show, :edit, :update, :destroy]
      
      def index
        @categories = Category.order(:name)
      end
      
      def show
        @posts = @category.posts.order(created_at: :desc).limit(10)
      end
      
      def new
        @category = Category.new
      end
      
      def create
        @category = Category.new(category_params)
        
        if @category.save
          redirect_to [:admin, @category], notice: 'Category was successfully created.'
        else
          render :new
        end
      end
      
      def edit
      end
      
      def update
        if @category.update(category_params)
          redirect_to [:admin, @category], notice: 'Category was successfully updated.'
        else
          render :edit
        end
      end
      
      def destroy
        if @category.posts.any?
          redirect_to admin_categories_path, alert: 'Cannot delete category with posts. Please reassign or delete posts first.'
        else
          @category.destroy
          redirect_to admin_categories_path, notice: 'Category was successfully deleted.'
        end
      end
      
      private
      
      def set_category
        @category = Category.find(params[:id])
      end
      
      def category_params
        params.require(:category).permit(:name, :slug, :description)
      end
    end
  end
end 