class Vote < ApplicationRecord
  belongs_to :choice
  has_one :poll, through: :choice
end
