# frozen_string_literal: true

class ShareCardComponent < ViewComponent::Base
  def initialize(poll:, title:, subtitle:, button_text:)
    @poll = poll
    @title = title
    @subtitle = subtitle
    @button_text = button_text
  end

  def render?
    @poll.published?
  end
end
