class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	
	has_and_belongs_to_many :categories, :autosave => true
	accepts_nested_attributes_for :categories


	validates :title , presence: true,
								length: { minimum: 5 }
	belongs_to :test_user, :class_name => "TestUser"

	# paginates_per 5
end
