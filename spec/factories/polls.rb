FactoryBot.define do
  factory :poll do
    title { Faker::Lorem.sentence(word_count: 7) }
    email { Faker::Internet.email }

    allow_recommendations { false }
    allow_comments { false }
    allow_sharing { false }
    discoverable { false }
    published { false }
  end
end
