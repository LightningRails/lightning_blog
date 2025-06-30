require 'rails/generators'

module LightningBlog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      
      desc "Install Lightning Blog into your Rails application"
      
      def copy_migrations
        rake "lightning_blog:install:migrations"
      end
      
      def add_routes
        route_content = "\n  # Lightning Blog Engine\n  mount LightningBlog::Engine => '/blog'\n"
        
        if File.exist?('config/routes.rb')
          routes_file = File.read('config/routes.rb')
          unless routes_file.include?('LightningBlog::Engine')
            inject_into_file 'config/routes.rb', route_content, after: "Rails.application.routes.draw do"
          end
        end
      end
      
      def check_tailwind_daisyui_setup
        @has_tailwind = detect_tailwind_setup
        @has_daisyui = detect_daisyui_setup
        @daisyui_method = detect_daisyui_method
      end
      
      def add_tailwind_classes_if_needed
        if @has_tailwind
          # Add Tailwind class detection script to application layout
          layout_file = 'app/views/layouts/application.html.erb'
          if File.exist?(layout_file)
            layout_content = File.read(layout_file)
            unless layout_content.include?('tailwind-loaded')
              script_tag = <<~HTML
                
                  <script>
                    // Detect if Tailwind is loaded for Lightning Blog styling
                    document.documentElement.classList.add('tailwind-loaded');
                  </script>
              HTML
              
              inject_into_file layout_file, script_tag, before: '</head>'
            end
          end
        end
      end
      
      def create_initializer
        tailwind_status = @has_tailwind ? "✅ Detected" : "❌ Not detected"
        daisyui_status = @has_daisyui ? "✅ Detected (#{@daisyui_method})" : "❌ Not detected"
        
        create_file "config/initializers/lightning_blog.rb", <<~RUBY
          # Lightning Blog Configuration
          # 
          # Detected setup:
          # - Tailwind CSS: #{tailwind_status}
          # - DaisyUI: #{daisyui_status}
          #
          # Lightning Blog works with any Rails application, with enhanced styling 
          # when Tailwind CSS and DaisyUI are available.
          #
          # Setup following: https://daisyui.com/docs/install/rails/
          
          # LightningBlog.configure do |config|
          #   # Set the number of posts per page (default: 10)
          #   # config.posts_per_page = 10
          #   
          #   # Enable/disable search functionality (default: true)
          #   # config.enable_search = true
          #   
          #   # Set the excerpt length (default: 150)
          #   # config.excerpt_length = 150
          #   
          #   # Enable/disable view tracking (default: true)
          #   # config.track_views = true
          #   
          #   # Force Tailwind mode (useful for custom setups)
          #   # config.force_tailwind_mode = false
          # end
        RUBY
      end
      
      def show_readme
        say ""
        say "=" * 70
        say "Lightning Blog has been installed! 🎉"
        say "=" * 70
        say ""
        
        if @has_tailwind && @has_daisyui
          say "🎨 Perfect! Your app has Tailwind CSS + DaisyUI"
          say "   Lightning Blog will use the enhanced styling!"
          say "   Method detected: #{@daisyui_method}"
        elsif @has_tailwind
          say "🎨 Great! Your app has Tailwind CSS"
          say "   To add DaisyUI for enhanced components, follow:"
          say "   https://daisyui.com/docs/install/rails/"
          say ""
          show_daisyui_setup_instructions
        else
          say "📝 Your app will use Lightning Blog's fallback styles"
          say "   For enhanced styling, consider adding Tailwind CSS + DaisyUI:"
          say "   https://daisyui.com/docs/install/rails/"
        end
        
        say ""
        say "Next steps:"
        say ""
        say "1. Run the migrations:"
        say "   $ rails db:migrate"
        say ""
        say "2. (Optional) Seed sample data:"
        say "   $ rails db:seed"
        say ""
        say "3. Visit your blog at: http://localhost:3000/blog"
        say ""
        
        unless @has_tailwind && @has_daisyui
          say "💡 For the best Lightning Blog experience:"
          say "   Follow the official DaisyUI Rails guide:"
          say "   https://daisyui.com/docs/install/rails/"
          say ""
        end
        
        say "📚 Documentation: Check out the README.md file"
        say "🐛 Issues: https://github.com/yourusername/lightning_blog/issues"
        say ""
        say "Happy blogging! ✨"
        say ""
      end
      
      private
      
      def detect_tailwind_setup
        # Check for tailwindcss-rails gem
        return true if gemfile_has_gem?('tailwindcss-rails')
        
        # Check for Tailwind config files
        File.exist?('config/tailwind.config.js') || 
        File.exist?('tailwind.config.js') ||
        File.exist?('app/assets/stylesheets/application.tailwind.css') ||
        File.exist?('app/assets/tailwind/application.css')
      end
      
      def detect_daisyui_setup
        return false unless @has_tailwind
        
        # Check all three official DaisyUI setup methods
        detect_daisyui_method != "none"
      end
      
      def detect_daisyui_method
        tailwind_css_file = find_tailwind_css_file
        return "none" unless tailwind_css_file && File.exist?(tailwind_css_file)
        
        content = File.read(tailwind_css_file)
        
        # Method 1: NPM plugin
        if content.include?('@plugin "daisyui"') && File.exist?('package.json')
          package_json = File.read('package.json')
          return "NPM Plugin" if package_json.include?('daisyui')
        end
        
        # Method 2: Downloaded JS files
        if content.include?('@plugin "./daisyui.js"') && 
           File.exist?('app/assets/tailwind/daisyui.js')
          return "Downloaded JS"
        end
        
        # Method 3: CDN import
        if content.include?('https://cdn.jsdelivr.net/npm/daisyui')
          return "CDN Import"
        end
        
        # Legacy detection for older setups
        if content.include?('daisyui') || gemfile_has_gem?('daisyui')
          return "Legacy/Custom"
        end
        
        "none"
      end
      
      def find_tailwind_css_file
        # Check common Tailwind CSS file locations
        potential_files = [
          'app/assets/tailwind/application.css',
          'app/assets/stylesheets/application.tailwind.css',
          'app/assets/stylesheets/application.css'
        ]
        
        potential_files.find { |file| File.exist?(file) }
      end
      
      def show_daisyui_setup_instructions
        say "   Quick setup options:"
        say ""
        say "   Method 1 (Recommended - NPM):"
        say "   $ npm install daisyui@latest"
        say "   Then add '@plugin \"daisyui\";' to your Tailwind CSS file"
        say ""
        say "   Method 2 (No Node.js):"
        say "   $ curl -sLo app/assets/tailwind/daisyui.js https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.js"
        say "   Then add '@plugin \"./daisyui.js\";' to your Tailwind CSS file"
        say ""
        say "   Method 3 (Quick CDN):"
        say "   Add '@import \"https://cdn.jsdelivr.net/npm/daisyui@5\";' to your Tailwind CSS file"
        say ""
      end
      
      def gemfile_has_gem?(gem_name)
        return false unless File.exist?('Gemfile')
        File.read('Gemfile').include?(gem_name)
      end
    end
  end
end 