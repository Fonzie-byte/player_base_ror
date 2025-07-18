# frozen_string_literal: true

class ValidationErrorComponent < ViewComponent::Base
  def initialize(errors)
    @errors = errors
  end
end
