require_relative 'wagon'

class PassangerWagon < Wagon
  attr_reader :available_seats, :num_of_seats
  def initialize(number, num_of_seats)
    super
    @num_of_seats = num_of_seats
    @available_seats = num_of_seats
  end

  def take_seat
    if self.available_seats > 0
      self.available_seats -= 1
    end
  end

  def occupied_seats
    self.num_of_seats - self.available_seats
  end

  private

  attr_writer :available_seats

end


