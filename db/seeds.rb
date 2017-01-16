# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#user seed data
user_one = User.create(fname: "Billy", lname: "Bob", password: "pw", username: "billybob", email: "billybob@aol.com")
user_two = User.create(fname: "Melvins", lname: "Melvin", password: "pw", username: "melvinsmelvin", email: "melvinsmelvin@aol.com")
user_three = User.create(fname: "Jimmy", lname: "Jam", password: "pw", username: "jimmyjam", email: "jimmyjam@aol.com")
user_four = User.create(fname: "Jane", lname: "Doe", password: "pw", username: "janedoe", email: "janedoe@aol.com")

#post seed data
post_one = Post.create(title: "This is the first blog post.", content: "Here is the content for blog post number one.", user_id: user_one.id)
post_two = Post.create(title: "This is the second blog post.", content: "Here is the content for blog post number two.", user_id: user_two.id)
post_three = Post.create(title: "This is the third blog post.", content: "Here is the content for blog post number three.", user_id: user_three.id)
post_four = Post.create(title: "This is the fourth blog post.", content: "Here is the content for blog post number four.", user_id: user_four.id)

#comment seed data
comment_one = Comment.create(content: "This is the first comment for blog post number one.", user_id: user_one.id, post_id: post_one.id)
comment_two = Comment.create(content: "This is the first comment for blog post number two.", user_id: user_two.id, post_id: post_two.id)
comment_three = Comment.create(content: "This is the first comment for blog post number three.", user_id: user_three.id, post_id: post_three.id)
comment_four = Comment.create(content: "This is the first comment for blog post number four.", user_id: user_four.id, post_id: post_four.id)
