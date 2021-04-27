# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

polls = ["Where should I go on vacation", "Where should I be buried", "Where should I get married", "Where should I go to college"]

polls.each do |p|
  poll = Poll.new(title: p, content: Faker::Lorem.sentence(word_count: 25))
  3.times do |i|
    poll.choices.build(title: Faker::Address.country, url: "https://google.com", content: Faker::Lorem.sentence(word_count: 10))
  end
  poll.save
end

Claimant.create! email: Faker::Internet.email