class ThreadContent < ActiveRecord::Base
	belongs_to :topic
	has_many :posts, :dependent => :destroy
end
