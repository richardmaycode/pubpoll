# == Schema Information
#
# Table name: claimants
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Claimant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
