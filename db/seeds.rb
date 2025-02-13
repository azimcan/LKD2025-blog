user = User.create(email: "test@test.com", password: "12345678")

5.times do
  Category.create(name: Faker::Lorem.word)
end

20.times do
  Post.create(title: Faker::Lorem.sentence,
              content: Faker::Lorem.paragraph,
              user: user,
              category: Category.order("RANDOM()").first)
end

30.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    post: Post.order("RANDOM()").first,
    user: user
  )
end
