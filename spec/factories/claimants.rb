# == Schema Information
#
# Table name: claimants
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :claimant do
    email { "MyString" }
    polls { "" }
  end
end
