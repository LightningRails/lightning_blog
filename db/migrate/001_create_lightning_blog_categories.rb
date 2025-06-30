class CreateLightningBlogCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :lightning_blog_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.integer :posts_count, default: 0
      
      t.timestamps
    end
    
    add_index :lightning_blog_categories, :slug, unique: true
    add_index :lightning_blog_categories, :name
  end
end 