# == Schema Information
#
# Table name: polls
#
#  id                    :bigint           not null, primary key
#  access_token          :string           not null
#  allow_comments        :boolean          default(FALSE), not null
#  allow_recommendations :boolean          default(FALSE), not null
#  allow_sharing         :boolean          default(FALSE), not null
#  claimed_at            :datetime
#  discoverable          :boolean          default(FALSE), not null
#  email                 :string
#  published             :boolean          default(TRUE), not null
#  slug                  :string           not null
#  title                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_polls_on_slug  (slug)
#
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
