class AddCountOfPostsToThreadContent < ActiveRecord::Migration
  def change
    add_column :thread_contents, :count_of_posts, :integer, default: 0, null: false
  end
end
