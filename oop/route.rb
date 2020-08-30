class Route
  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
    puts "Station #{station} was inserted."
  end

  def delete_station(station)
    if stations.any?
      stations.delete(station)
      puts "Station #{station} was deleted."
    else
      puts "There are no stations!"
    end
  end
end


