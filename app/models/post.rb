class Post < ActiveRecord::Base
	belongs_to :thread_content, counter_cache: :count_of_posts
end
