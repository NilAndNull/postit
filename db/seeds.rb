# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


first_user = User.create(username: 'ablm')
first_post = Post.create(title: "My first post", 
                         description: "I sure hope this works!", 
                         url: "www.yahoo.com", 
                         creator: first_user)

second_user = User.create(username: 'jpcr')
second_post = Post.create(title: "Hello World", 
                          description: "Good morning!", 
                          url: "www.google.com", 
                          creator: second_user)

first_comment = Comment.create(body: 'One Patato!',
                               creator: second_user,
                               post: first_post)

second_comment = Comment.create(body: 'Two Patato!',
                                creator: first_user,
                                post: second_post)

first_category = Category.create(name: 'Politics')
second_category = Category.create(name: 'History')


# Auto generated fake data

users = [];

# Create users
8.times do 
  username = Faker::Internet.user_name
  users.push(User.create(username: username))
end

# Create categories

3.times do
  name = Faker::Hacker.noun.capitalize
  Category.create(name: name)
end

all_categories = Category.all

users.each do |user|

  # Create posts per user
  10.times do

    title = Faker::Lorem.sentence
    description = Faker::Lorem.sentences(Random.rand(3...10))
    url = Faker::Internet.url

    post = Post.create(title: title, 
                     description: description, 
                     url: url,
                     creator: user)

    # Associate one random category to post
    post.categories << all_categories.sample

    # Create comments per post from random users
    3.times do
      body = Faker::Lorem.sentences(Random.rand(1...5))
      Comment.create(body: body, creator: users.sample, post: post)
    end

  end

end











