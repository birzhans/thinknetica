require_relative 'brand'
require_relative 'instance_counter'

class Train
  include Brand
  include InstanceCounter

  @@trains = []
  attr_accessor :speed
  attr_reader :number, :wagons

  def self.find(number)
    @@trains.detect { |train| train.number == number }
  end


  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@trains.append(self)
    register_instance
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    wagons << wagon if speed.zero?
  end

  def remove_wagon(wagon)
    if speed.zero? & self.wagons.any?
      self.wagons.delete(wagon)
    end
  end

  def add_route(route)
    self.route = route
    self.station = route.start_station
    @station.add_train(self)
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

  private
  # added to private to restrict
  # changig these attributes
  attr_writer :station, :route

end


