class Choice < ApplicationRecord
  belongs_to :poll, inverse_of: :choices

  validates :title, presence: true
end
