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
class Poll < ApplicationRecord
  ## 0. MODEL EXTENSIONS
  # - includes / extends
  extend FriendlyId

  # - Gems
  friendly_id :slug

  # - serialized attributes
  ## 1. ASSOCIATIONS /ATTRIBUTES
  belongs_to :claimant, optional: true
  has_many :choices, dependent: :destroy, inverse_of: :poll

  accepts_nested_attributes_for :choices, allow_destroy: true

  has_rich_text :content

  # - attr_accessible

  ## 2. SCOPES
  scope :claimed, -> { where("claimed_at IS NOT NULL") }
  scope :unclaimed, -> { where("claimed_at IS NULL") }

  ## 3. CLASS METHODS

  ## 4. VALIDATES
  validates :title, presence: true
  # validates :email, format: {with: /[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]g/, message: "email invalid"}, length: {minimum: 4, maximum: 254}, allow_blank: true
  validates :choices, length: {minimum: 2, message: "are required. Please include at least 2 choices."}

  ## 5. CALLBACKS
  before_create :setup_poll
  after_save  :claimant_check
  ## 6. INSTANCE METHODS
  # - first attribues formatting
  # - other methods
  def setup_poll
    update_slug
    update_access_token
  end

  def update_slug
    slug = generate_slug
    self.slug = slug
  end

  def generate_slug
    loop do
      value = [*("a".."z"), *("0".."9")].sample(8).join
      break value unless self.class.exists?(slug: value)
    end
  end

  def update_access_token
    access_token = generate_access_token
    self.access_token = access_token
  end

  def generate_access_token
    (Faker::Color.color_name + Faker::Ancient.god + Faker::Military.army_rank).delete(" ")
  end

  def claimant_check
    return unless previous_changes["claimant_id"].present?
    
    self.touch(:claimed_at) if claimant_id.present?

    update_column(:claimed_at, nil)
  end
  # - private methods
end
