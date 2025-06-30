require 'bundler/setup'
require 'lightning_blog'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end 