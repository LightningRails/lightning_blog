require "lightning_blog/version"
require "lightning_blog/engine"

module LightningBlog
  class Configuration
    attr_accessor :theme, :posts_per_page, :enable_search, :excerpt_length, :track_views, :force_tailwind_mode
    
    def initialize
      @theme = 'light'
      @posts_per_page = 10
      @enable_search = true
      @excerpt_length = 150
      @track_views = true
      @force_tailwind_mode = false
    end
  end
  
  class << self
    attr_accessor :configuration
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield(configuration)
  end
  
  def self.theme
    configuration.theme
  end
  
  def self.posts_per_page
    configuration.posts_per_page
  end
  
  def self.enable_search?
    configuration.enable_search
  end
  
  def self.excerpt_length
    configuration.excerpt_length
  end
  
  def self.track_views?
    configuration.track_views
  end
  
  def self.force_tailwind_mode?
    configuration.force_tailwind_mode
  end
end
