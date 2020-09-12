require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    validate!
    @stations = [start_station, end_station]
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    if stations.any?
      stations.delete(station)
    end
  end

  protected

  def validate!
    raise "Start or end station is not given." if start_station.nil? && end_station.nil?
    raise "Incorrect station's type." if start_station.class.to_s != 'Station' && end_station.class.to_s != 'Station'
  end
end


