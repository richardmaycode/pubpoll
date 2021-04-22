class Poll < ApplicationRecord
  extend FriendlyId
  friendly_id :slug
  has_rich_text :content

  has_many :choices, dependent: :destroy, inverse_of: :poll

  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :title, presence: true
  validates :email, presence: true
  validates :choices, length: {minimum: 2, message: "are required. Please include at least 2 choices."}

  before_create :setup_poll

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
end
