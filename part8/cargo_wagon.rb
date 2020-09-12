require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :available_volume, :volume

  def initialize(number, volume)
    super
    @volume = volume
    @available_volume = volume
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


