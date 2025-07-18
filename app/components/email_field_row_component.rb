# frozen_string_literal: true

class EmailFieldRowComponent < ViewComponent::Base
  def initialize(form:, model:, prop:)
    @form = form
    @model = model
    @prop = prop
  end
end
