module LightningBlog
  module Admin
    class ApplicationController < LightningBlog::ApplicationController
      layout 'lightning_blog/admin/application'
      
      before_action :authenticate_admin!
      
      private
      
      def authenticate_admin!
        # Hook for authentication - users can override this method
        if respond_to?(:current_user)
          unless current_user&.admin?
            redirect_to main_app.root_path, alert: 'Access denied. Admin privileges required.'
            return
          end
        elsif LightningBlog.admin_authentication_method
          # Use custom authentication method if provided
          instance_eval(&LightningBlog.admin_authentication_method)
        else
          # Default: require a simple password check in development
          if Rails.env.development?
            session_key = 'lightning_blog_admin_authenticated'
            unless session[session_key]
              if request.post? && params[:admin_password] == 'admin123'
                session[session_key] = true
                redirect_to request.path
                return
              else
                render 'lightning_blog/admin/shared/login', layout: 'lightning_blog/admin/login'
                return
              end
            end
          else
            # In production, require proper authentication setup
            raise "Lightning Blog admin authentication not configured. Please set LightningBlog.admin_authentication_method in your initializer."
          end
        end
      end
    end
  end
end 