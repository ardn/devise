class Comment < ActiveRecord::Base
  belongs_to :post

  paginates_per 5
end
