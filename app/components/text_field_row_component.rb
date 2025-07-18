# frozen_string_literal: true

class TextFieldRowComponent < ViewComponent::Base
  def initialize(form:, model:, prop:)
    @form = form
    @model = model
    @prop = prop
  end
end
