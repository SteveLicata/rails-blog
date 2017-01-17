class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
#a comment belongs to a user and many posts
