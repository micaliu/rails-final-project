class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :thread_content_id
      t.integer :count_of_posts, default: 0, null: false

      t.timestamps null: false
    end
  end
end
