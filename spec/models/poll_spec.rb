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
#  published             :boolean          default(TRUE), not null
#  slug                  :string           not null
#  title                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  claimant_id           :bigint
#
# Indexes
#
#  index_polls_on_claimant_id  (claimant_id)
#  index_polls_on_slug         (slug)
#
# Foreign Keys
#
#  fk_rails_...  (claimant_id => claimants.id)
#
require 'rails_helper'

RSpec.describe Poll, type: :model do
  subject(:poll) { create(:poll) }
  describe "#generate_slug" do
    context "when creating a poll" do
      it "will create a unique slug" do
        slug = subject.generate_slug
        expect(Poll.exists?(slug: slug)).to be false  
      end

      it "will generate a slug with length of 8" do
        slug = subject.generate_slug
        expect(slug.length).to eq(8)  
      end
    end
  end
end
