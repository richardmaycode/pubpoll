# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

polls = ["What car should I buy", "What Stocks should I buy", "Where should I go on vacation"]

polls.each do |p|
  poll = Poll.create! title: p, email: "test"
  5.times do |i|
    poll.choices.create(title: "Test choice #{i}")
  end
end
