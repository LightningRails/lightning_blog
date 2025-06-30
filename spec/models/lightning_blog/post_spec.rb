require 'spec_helper'

RSpec.describe LightningBlog::Post do
  describe 'validations' do
    it 'requires a title' do
      post = LightningBlog::Post.new
      expect(post.valid?).to be false
      expect(post.errors[:title]).to include("can't be blank")
    end
    
    it 'requires content' do
      post = LightningBlog::Post.new
      expect(post.valid?).to be false
      expect(post.errors[:content]).to include("can't be blank")
    end
  end
  
  describe 'slug generation' do
    it 'generates slug from title' do
      post = LightningBlog::Post.new(title: "My Test Post")
      post.valid?
      expect(post.slug).to eq("my-test-post")
    end
  end
  
  describe 'published status' do
    it 'defaults to unpublished' do
      post = LightningBlog::Post.new
      expect(post.published?).to be false
      expect(post.draft?).to be true
    end
  end
  
  describe 'reading time calculation' do
    it 'calculates reading time based on word count' do
      content = "word " * 200  # 200 words
      post = LightningBlog::Post.new(content: content)
      expect(post.reading_time).to eq(1)
    end
  end
end 