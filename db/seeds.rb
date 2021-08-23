require 'faker'

puts "🌱 Seeding spices..."

Book.destroy_all
User.destroy_all
Review.destroy_all
# Seed your database here
20.times do 
    Book.create(
        title: Faker::Book.title,
        author: Faker::Book.author,
        publisher: Faker::Book.publisher,
        genre: Faker::Book.genre,
        page_count: rand(100..500)
    )
end

20.times do
    User.create(
        birthday: Faker::Date.birthday(min_age: 13, max_age: 99),
        name: Faker::Name.name,
        xp: rand(0..1000)
    )
end

20.times do 
    Review.create(
        user_id: User.ids.sample,
        book_id: Book.ids.sample,
        content: Faker::Lorem.paragraph,
        rating: rand(1..5)
    )
end

puts "✅ Done seeding!"
