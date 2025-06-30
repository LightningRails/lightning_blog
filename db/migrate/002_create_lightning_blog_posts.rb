class CreateLightningBlogPosts < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:lightning_blog_posts)
      create_table :lightning_blog_posts do |t|
        t.string :title, null: false
        t.string :slug, null: false
        t.text :excerpt
        t.text :content, null: false
        t.boolean :published, default: false
        t.datetime :published_at
        t.string :featured_image
        t.string :meta_title
        t.text :meta_description
        t.references :category, null: true, foreign_key: { to_table: :lightning_blog_categories }
        t.integer :views_count, default: 0
        
        t.timestamps
      end
      
      add_index :lightning_blog_posts, :slug, unique: true
      add_index :lightning_blog_posts, :published
      add_index :lightning_blog_posts, :published_at
      # Note: category_id index is automatically created by t.references
    end
  end
end 