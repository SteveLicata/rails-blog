class User < ApplicationRecord
  has_many :posts
  has_many :comments
end
#a user has many posts and has many comments
