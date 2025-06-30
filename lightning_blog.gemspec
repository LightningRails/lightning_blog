require_relative "lib/lightning_blog/version"

Gem::Specification.new do |spec|
  spec.name        = "lightning_blog"
  spec.version     = LightningBlog::VERSION
  spec.authors     = [ "Daniel Rodriguez" ]
  spec.email       = [ "daniel.rod93@gmail.com" ]
  spec.homepage    = "https://github.com/yourusername/lightning_blog"
  spec.summary     = "A mountable blog engine for Rails applications with Tailwind/DaisyUI support."
  spec.description = "Lightning Blog is a Rails engine that provides a complete blog solution that can be easily mounted into any Rails application. Features include post management, categories, search, and responsive design with optional Tailwind CSS and DaisyUI styling."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yourusername/lightning_blog"
  spec.metadata["changelog_uri"] = "https://github.com/yourusername/lightning_blog/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  # Ruby version requirement
  spec.required_ruby_version = ">= 3.0.0"

  # Rails dependency - works with any Rails app
  spec.add_dependency "rails", ">= 7.0.0", "< 9.0"
  spec.add_dependency "image_processing", "~> 1.2"

  # Optional Tailwind/DaisyUI support
  spec.add_development_dependency "tailwindcss-rails", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
