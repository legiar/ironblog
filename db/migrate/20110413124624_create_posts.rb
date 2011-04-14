class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :user
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :teaser
      t.text :body
      t.boolean :active
      t.datetime :published_at
      t.timestamps
      t.datetime :edited_at, :null => false
    end

    add_index :posts, [:published_at], :name => 'index_posts_on_published_at'
  end

  def self.down
    #drop_table :posts
    raise IrreversibleMigration
  end
end
