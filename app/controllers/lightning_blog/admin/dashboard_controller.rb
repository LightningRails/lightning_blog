module LightningBlog
  module Admin
    class DashboardController < Admin::ApplicationController
      def index
        @stats = {
          total_posts: Post.count,
          published_posts: Post.published.count,
          draft_posts: Post.draft.count,
          total_categories: Category.count,
          total_views: Post.sum(:views_count)
        }
        
        @recent_posts = Post.includes(:category).order(created_at: :desc).limit(5)
        @popular_posts = Post.published.order(views_count: :desc).limit(5)
      end
    end
  end
end 