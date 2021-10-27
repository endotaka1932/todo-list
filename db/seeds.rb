# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# mike = User.create!(email: 'mike@example.com', password: 'password')

john = User.create!(email: 'john@example.com', password: 'password')
nike = User.create!(email: 'nike@example.com', password: 'password')

5.times do
    john.boards.create!(
        title: Faker::Lorem.sentence(word_count: 1),
        content: Faker::Lorem.sentence(word_count: 5)
    )
end

5.times do
    nike.boards.create!(
        title: Faker::Lorem.sentence(word_count: 1),
        content: Faker::Lorem.sentence(word_count: 5)
    )
end
