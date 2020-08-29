class Train
  attr_accessor :speed, :station, :num_of_cars, :route, :place
  attr_reader :number, :type

  def initialize(number, type, num_of_cars)
    @number = number
    # freight or passanger
    @type = type
    @num_of_cars = num_of_cars
    @speed = 0
    @place = 0
  end

  def stop
    self.speed = 0
  end

  def add_car
    self.num_of_cars += 1 if speed == 0
  end

  def remove_car
    self.num_of_cars -= 1 if speed == 0 & num_of_cars > 0
  end

  def add_route(route)
    self.route = route
    self.station = route.stations[0]
    route.start.add_train(self)
  end

  def go_forward
    if place < num_of_cars - 1
      self.place += 1
      self.station = self.route.stations[place]
    end
  end

  def go_backward
    place -= 1
    self.station = self.route.stations[place]
  end

  def next_station
    route.stations[place+1]
  end

  def previous_station
    route.stations[place-1]
  end
end


