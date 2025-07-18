# frozen_string_literal: true

class PasswordFieldRowComponent < ViewComponent::Base
  def initialize(form:, model:, prop:)
    @form = form
    @model = model
    @prop = prop
  end
end
