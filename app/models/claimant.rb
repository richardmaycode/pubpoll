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
  
end