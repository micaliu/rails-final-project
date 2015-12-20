class Topic < ActiveRecord::Base
	has_many :thread_contents, :dependent => :destroy
end
