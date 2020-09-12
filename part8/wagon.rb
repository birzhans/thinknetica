require_relative 'validation'

class Wagon
  include Brand
  include Validation

  def initialize(number, num_of_seats)
    @name = number
    validate!
  end
end


