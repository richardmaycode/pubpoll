# == Schema Information
#
# Table name: recommendations
#
#  id              :bigint           not null, primary key
#  title           :string
#  url             :string
#  user_identifier :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  poll_id         :bigint           not null
#
# Indexes
#
#  index_recommendations_on_poll_id  (poll_id)
#
# Foreign Keys
#
#  fk_rails_...  (poll_id => polls.id)
#
FactoryBot.define do
  factory :recommendation do
    title { "MyString" }
    url { "MyString" }
    poll { nil }
  end
end
