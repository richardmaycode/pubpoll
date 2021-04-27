# == Schema Information
#
# Table name: choices
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :bigint           not null
#
# Indexes
#
#  index_choices_on_poll_id  (poll_id)
#
# Foreign Keys
#
#  fk_rails_...  (poll_id => polls.id)
#
class Choice < ApplicationRecord
  belongs_to :poll, inverse_of: :choices
  has_many :votes
  
  validates :title, presence: true
end
