module LightningBlog
  class Category < ApplicationRecord
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: true
    
    before_validation :generate_slug
    
    scope :with_published_posts, -> { joins(:posts).where(posts: { published: true }).distinct }
    
    def to_param
      slug
    end
    
    private
    
    def generate_slug
      self.slug = name.to_s.parameterize if name.present? && slug.blank?
    end
  end
end 