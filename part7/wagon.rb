require_relative 'validation'

class Wagon
  include Brand
  include Validation

  def initialize(number)
    @name = number
    validate!
  end
end


