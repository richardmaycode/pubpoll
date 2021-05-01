# == Schema Information
#
# Table name: votes
#
#  id              :bigint           not null, primary key
#  user_identifier :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  choice_id       :bigint           not null
#
# Indexes
#
#  index_votes_on_choice_id  (choice_id)
#
# Foreign Keys
#
#  fk_rails_...  (choice_id => choices.id)
#
class Vote < ApplicationRecord
  has_rich_text :content

  belongs_to :choice
  has_one :poll, through: :choice
end
