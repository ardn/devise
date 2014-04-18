class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title , presence: true,
								length: { minimum: 5 }

	# paginates_per 5
end
