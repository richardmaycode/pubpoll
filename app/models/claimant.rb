# == Schema Information
#
# Table name: claimants
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Claimant < ApplicationRecord
  has_many :polls

  # validates :email, format: {with: /[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]g/, message: "is in an invalid format"}, length: {minimum: 4, maximum: 254}
end
