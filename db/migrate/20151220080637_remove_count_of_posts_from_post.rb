class RemoveCountOfPostsFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :count_of_posts, :integer
  end
end
