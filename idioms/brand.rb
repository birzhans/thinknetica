# frozen_string_literal: true

require_relative 'validation'

# module Brand for trains
module Brand
  def brand=(name)
    validate!
    self.name = name
  end

  def brand
    name
  end

  protected

  attr_accessor :name
end
