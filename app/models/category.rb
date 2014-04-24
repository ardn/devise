class Category < ActiveRecord::Base
	has_and_belongs_to_many :posts, :autosave => true
	accepts_nested_attributes_for :posts
end
