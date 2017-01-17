class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
end
#a post belongs to a user and has many comments
