# frozen_string_literal: true

class ModelTableComponent < ViewComponent::Base
  def initialize(rows:, props:, model:)
    @rows = rows
    @props = props
    @model = model
  end
end
