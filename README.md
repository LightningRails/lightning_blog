# Lightning Blog

A mountable blog engine for **any Rails application** with enhanced styling for Tailwind CSS and DaisyUI. Originally designed for Lightning Rails but works perfectly with any Rails app!

## ✨ Universal Rails Compatibility

Lightning Blog is designed to work with:
- ✅ **Lightning Rails** (enhanced experience with Tailwind + DaisyUI)
- ✅ **Standard Rails apps with Tailwind CSS** (great styling)
- ✅ **Any Rails application** (beautiful fallback styles)

## Features

- 📝 **Full Blog Functionality**: Create, manage, and display blog posts
- 📂 **Categories**: Organize posts by categories
- 🔍 **Search**: Full-text search across posts
- 📱 **Responsive Design**: Mobile-friendly interface that works everywhere
- 🖼️ **Image Support**: Featured images for posts using Active Storage
- 📊 **Analytics**: View counts and post statistics
- 🎨 **Smart Styling**: Enhanced UI with Tailwind/DaisyUI, graceful fallbacks without
- ⚡ **Lightning Fast**: Optimized for performance
- 🌙 **Dark Mode**: Automatic dark mode support

## Styling Options

### 🚀 **Lightning Rails Users (Recommended)**
Get the full experience with Tailwind CSS and DaisyUI components perfectly integrated with your Lightning Rails application.

### 🎨 **Tailwind CSS Users**
Enhanced styling with Tailwind classes. Add [DaisyUI following the official Rails guide](https://daisyui.com/docs/install/rails/) for the complete component library.

### 📝 **Standard Rails Users**
Beautiful fallback styles that match modern design principles. No additional dependencies required!

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'lightning_blog', path: '/path/to/lightning_blog'
```

Or if you're using it from a Git repository:

```ruby
gem 'lightning_blog', git: 'https://github.com/LightningRails/lightning_blog.git'
```

And then execute:

```bash
$ bundle install
```

## Setup

### 🚀 **Quick Setup (Recommended)**

Use the automated installer:

```bash
$ rails generate lightning_blog:install
```

This will:
- ✅ Copy migrations to your app
- ✅ Mount the blog engine at `/blog`
- ✅ Detect your Tailwind/DaisyUI setup automatically
- ✅ Create a configuration file
- ✅ Provide setup guidance based on your environment

### 📋 **Manual Setup**

1. **Copy and run migrations:**

```bash
$ rails lightning_blog:install:migrations
$ rails db:migrate
```

2. **Mount the engine** in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount LightningBlog::Engine => "/blog"
  # Your other routes...
end
```

3. **Seed sample data** (optional, for development):

```bash
$ rails db:seed
```

## Configuration Based on Your Setup

### For Lightning Rails Apps
```ruby
# The gem automatically detects Lightning Rails and uses enhanced styling
# No additional configuration needed! 🎉
```

### For Tailwind CSS Apps

Following the [official DaisyUI Rails guide](https://daisyui.com/docs/install/rails/), you have 3 options:

#### Method 1: NPM Plugin (Recommended)
```bash
# Install DaisyUI via NPM
npm install daisyui@latest
```

Add to your `app/assets/tailwind/application.css`:
```css
@import "tailwindcss" source(none);
@source "../../../public/*.html";
@source "../../../app/helpers/**/*.rb";
@source "../../../app/javascript/**/*.js";
@source "../../../app/views/**/*";

@plugin "daisyui";
```

#### Method 2: Downloaded JS (No Node.js required)
```bash
# Download DaisyUI files
curl -sLo app/assets/tailwind/daisyui.js https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.js
```

Add to your `app/assets/tailwind/application.css`:
```css
@import "tailwindcss" source(none);
@source "../../../public/*.html";
@source "../../../app/helpers/**/*.rb";
@source "../../../app/javascript/**/*.js";
@source "../../../app/views/**/*";

@plugin "./daisyui.js";
```

#### Method 3: CDN Import (Quick setup)
Add to your `app/assets/tailwind/application.css`:
```css
@import "tailwindcss" source(none);
@source "../../../public/*.html";
@source "../../../app/helpers/**/*.rb";
@source "../../../app/javascript/**/*.js";
@source "../../../app/views/**/*";

@import "https://cdn.jsdelivr.net/npm/daisyui@5";
```

### For Standard Rails Apps
```ruby
# The gem includes beautiful fallback styles - works out of the box!
# Optionally add Tailwind CSS + DaisyUI for enhanced experience:
# https://daisyui.com/docs/install/rails/
```

## Usage

### Accessing the Blog

Once mounted, your blog will be available at:

- **Blog Index**: `/blog` - Lists all published posts
- **Individual Posts**: `/blog/post-slug` - Shows a specific post
- **Categories**: `/blog/categories` - Lists all categories
- **Category Posts**: `/blog/category/category-slug` - Posts by category
- **Search**: `/blog?search=query` - Search posts

### Managing Content

Lightning Blog provides models for managing your blog content:

#### Creating Posts

```ruby
# Create a new category
category = LightningBlog::Category.create!(
  name: "Technology",
  slug: "technology",
  description: "Posts about technology"
)

# Create a new post
post = LightningBlog::Post.create!(
  title: "My First Blog Post",
  slug: "my-first-blog-post",
  content: "This is the content of my blog post...",
  excerpt: "A brief excerpt...",
  category: category,
  published: true
)
```

## Customization

### 🎨 **For Tailwind/DaisyUI Users**

The gem uses Tailwind classes and DaisyUI components. You can customize themes following the [Lightning Rails theming guide](https://docs.lightningrails.com/getting-started/publish-your-docs#custom-theme):

```css
/* Custom theme in your application.css */
[data-theme="lightning-blog"]{
  --color-primary: #F9462F;
  --color-primary-content: #ffffff;
  --color-secondary: #000000;
  --color-base-100: #ffffff;
  /* ... other DaisyUI variables */
}
```

### 📝 **For Standard Rails Users**

Override styles in your `application.css`:

```css
/* Override Lightning Blog styles */
body:not(.tailwind-loaded) .card {
  background-color: your-color;
  /* Your custom styles */
}
```

### 🔧 **Custom Views**

Override any view by creating the corresponding file in your application:

```
app/views/lightning_blog/
├── posts/
│   ├── index.html.erb
│   └── show.html.erb
├── categories/
│   ├── index.html.erb
│   └── show.html.erb
└── layouts/
    └── application.html.erb
```

### 🛠 **Routes Customization**

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Mount at root path
  mount LightningBlog::Engine => "/"
  
  # Or mount at custom path
  mount LightningBlog::Engine => "/articles"
  
  # Add custom routes
  get "/latest-posts", to: "lightning_blog/posts#index"
end
```

## Integration Examples

### With Lightning Rails
```ruby
# Works seamlessly - enhanced styling automatically applied!
# Perfect integration with your Lightning Rails design system
```

### With Devise Authentication
```ruby
# app/controllers/lightning_blog/application_controller.rb
module LightningBlog
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!, if: :admin_required?
    
    private
    
    def admin_required?
      params[:action].in?(['new', 'create', 'edit', 'update', 'destroy'])
    end
  end
end
```

### With Your Analytics
```ruby
# Track blog performance
<% if params[:controller] == 'lightning_blog/posts' && params[:action] == 'show' %>
  gtag('event', 'page_view', {
    page_title: '<%= @post.title %>',
    page_location: '<%= request.url %>'
  });
<% end %>
```

## API Reference

### Post Model

```ruby
LightningBlog::Post.published          # Published posts only
LightningBlog::Post.recent             # Ordered by creation date
LightningBlog::Post.by_category(cat)   # Posts in specific category
LightningBlog::Post.search("query")    # Search posts

post = LightningBlog::Post.first
post.reading_time                      # Estimated reading time
post.increment_views!                  # Increment view count
post.published?                        # Check if published
```

### Category Model

```ruby
LightningBlog::Category.with_published_posts  # Categories with published posts

category = LightningBlog::Category.first
category.posts.published                      # Published posts in category
```

## Development

### Testing

```bash
# Run all tests
$ bundle exec rspec

# Build the gem
$ gem build lightning_blog.gemspec
```

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LightningRails/lightning_blog.

## FAQ

### **Q: Will this work with my existing Rails app?**
A: Yes! Lightning Blog works with any Rails application (Rails 7.0+). It includes fallback styles for apps without Tailwind.

### **Q: Do I need Tailwind CSS?**
A: No, but it's recommended for the best experience. The gem includes beautiful fallback styles for standard Rails apps.

### **Q: How do I properly set up DaisyUI?**
A: Follow the [official DaisyUI Rails installation guide](https://daisyui.com/docs/install/rails/) - our installer will detect your setup automatically.

### **Q: Can I use this with Bootstrap or other CSS frameworks?**
A: Absolutely! The gem's styles are designed to coexist with other CSS frameworks.

### **Q: How do I add admin functionality?**
A: Create admin controllers in your main app to manage Lightning Blog models, or integrate with existing admin panels.

## Support Matrix

| Rails Version | Ruby Version | Tailwind | DaisyUI | Status |
|---------------|--------------|----------|---------|---------|
| 7.0+ | 3.0+ | ✅ | ✅ (NPM Plugin) | ✅ Full Support |
| 7.0+ | 3.0+ | ✅ | ✅ (Downloaded JS) | ✅ Full Support |
| 7.0+ | 3.0+ | ✅ | ✅ (CDN Import) | ✅ Full Support |
| 7.0+ | 3.0+ | ✅ | ❌ | ✅ Enhanced Styling |
| 7.0+ | 3.0+ | ❌ | ❌ | ✅ Fallback Styles |

## Official Resources

- 📖 [DaisyUI Rails Installation Guide](https://daisyui.com/docs/install/rails/)
- 🎨 [DaisyUI Components](https://daisyui.com/components/)
- ⚡ [Lightning Rails Documentation](https://docs.lightningrails.com/)
- 🎯 [Lightning Rails Theming Guide](https://docs.lightningrails.com/getting-started/publish-your-docs#custom-theme)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Changelog

### Version 0.1.0

- ✅ Universal Rails compatibility
- ✅ Official DaisyUI Rails integration (all 3 methods)
- ✅ Automatic setup detection
- ✅ Fallback styles for standard Rails
- ✅ Search functionality
- ✅ Category management
- ✅ Responsive design
- ✅ SEO optimization

## Support

For support, please:

1. Check the [official DaisyUI Rails guide](https://daisyui.com/docs/install/rails/)
2. Review the documentation above
3. Search existing issues on GitHub
4. Create a new issue with detailed information

---

Built with ❤️ for the Rails community. Optimized for Lightning Rails, perfect for everyone! ⚡
