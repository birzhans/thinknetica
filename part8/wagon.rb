require_relative 'validation'

class Wagon
  attr_reader :available_volume, :volume

  include Brand
  include Validation

  def initialize(number, volume)
    @name = number
    @volume = volume
    @available_volume = volume
    validate!
  end

  def load(weight)
    self.available_volume -= weight
  end

  def used_volume
    self.volume - self.available_volume
  end

  private

  attr_writer :available_volume
end


