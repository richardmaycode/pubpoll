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
