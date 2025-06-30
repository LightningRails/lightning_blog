module LightningBlog
  class Post < ApplicationRecord
    belongs_to :category, optional: true, counter_cache: true
    
    has_one_attached :featured_image_file
    
    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :content, presence: true
    
    before_validation :generate_slug
    before_save :set_published_at
    
    scope :published, -> { where(published: true) }
    scope :draft, -> { where(published: false) }
    scope :recent, -> { order(created_at: :desc) }
    scope :by_category, ->(category) { where(category: category) }
    scope :search, ->(query) { where("title ILIKE ? OR content ILIKE ?", "%#{query}%", "%#{query}%") }
    
    def to_param
      slug
    end
    
    def published?
      published
    end
    
    def draft?
      !published?
    end
    
    def reading_time
      words_per_minute = 200
      word_count = content.to_s.split.size
      (word_count / words_per_minute.to_f).ceil
    end
    
    def increment_views!
      increment!(:views_count)
    end
    
    private
    
    def generate_slug
      self.slug = title.to_s.parameterize if title.present? && slug.blank?
    end
    
    def set_published_at
      if published? && published_at.blank?
        self.published_at = Time.current
      elsif !published?
        self.published_at = nil
      end
    end
  end
end 