class Train
  attr_accessor :speed, :station, :num_of_cars, :route, :place
  attr_reader :number, :type

  def initialize(number, type, num_of_cars)
    @number = number
    # freight or passanger
    @type = type
    @num_of_cars = num_of_cars
    @speed = 0
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
    self.station = route.start_station
    station.add_train(self)
  end

  def go_forward
    if station != route.end_station
      station.send_train(self)
      self.station = self.next_station
      station.add_train(self)
    else
      puts "You are at the last station."
    end
  end

  def go_backward
    if station != route.start_station
      station.send_train(self)
      self.station = self.previous_station
      station.add_train(self)
    else
      puts "You are at the first station."
    end
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    if station == route.start_station
      nil
    else
      route.stations[route.stations.index(station) - 1]
    end
  end
end


