# frozen_string_literal: true

class CheckboxFormComponent < ViewComponent::Base
  def initialize(object:, field:, label:)
    @object = object
    @field = field
    @label = label
  end
end
