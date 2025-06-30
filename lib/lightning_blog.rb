require "lightning_blog/version"
require "lightning_blog/engine"

module LightningBlog
  # Configuration variables
  mattr_accessor :theme, default: 'light'
  mattr_accessor :posts_per_page, default: 10
  mattr_accessor :enable_search, default: true
  mattr_accessor :excerpt_length, default: 150
  mattr_accessor :track_views, default: true
  mattr_accessor :force_tailwind_mode, default: false
  mattr_accessor :admin_authentication_method, default: nil
  
  # Configuration block
  def self.configure
    yield self
  end
  
  # Convenience methods
  def self.enable_search?
    enable_search
  end
  
  def self.track_views?
    track_views
  end
end
