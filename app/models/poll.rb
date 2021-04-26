class Poll < ApplicationRecord
  ## 0. MODEL EXTENSIONS
  # - includes / extends
  extend FriendlyId

  # - Gems
  friendly_id :slug

  # - serialized attributes
  ## 1. ASSOCIATIONS /ATTRIBUTES
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
  validates :email, format: {with: /[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]g/, message: "email invalid"}, length: {minimum: 4, maximum: 254}, allow_blank: true
  validates :choices, length: {minimum: 2, message: "are required. Please include at least 2 choices."}

  ## 5. CALLBACKS
  before_create :setup_poll

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

  # - private methods
end
