require_relative 'brand'
require_relative 'validation'
require_relative 'instance_counter'

class Train
  include Brand
  include InstanceCounter
  include Validation

  @@trains = {}
  attr_accessor :speed
  attr_reader :number, :wagons

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i

  def self.find(number)
    @@trains[number]
  end


  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@trains[number] = self
    validate!
    register_instance
  end

  def each_wagon
    self.wagons.each { |w| yield w }
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
    end
  end

  def go_backward
    if station != route.start_station
      station.send_train(self)
      self.station = self.previous_station
      station.add_train(self)
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

  def validate!
    raise "Number can't be nil." if number.nil?
    raise "Number must have at least 5 symbols." if number.length < 5
    raise "Number has invalid format." if number !~ NUMBER_FORMAT
  end

end


