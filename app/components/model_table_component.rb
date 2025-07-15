# frozen_string_literal: true

class ModelTableComponent < ViewComponent::Base
  def initialize(rows:, props:, headers: nil)
    @rows = rows
    @model_class = rows[0].class.name.downcase
    @props = props
    @headers = headers || props
  end
end
