require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'cargo_wagon'
require_relative 'passanger_wagon'


class Session
  attr_accessor :train, :route, :station, :choice, :trains, :routes, :stations
  def initialize
    @choice = 0
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
    start
  end

  def start
    while self.choice != 3
      puts '0 => create objects'
      puts '1 => manipulate created objects'
      puts '2 => display objects'
      puts '3 => quit'
      self.choice = gets.chomp.to_i
      case choice
      when 0
        puts '0 => create station'
        puts '1 => create train'
        puts '2 => create route'
        puts '3 => create wagon'
        second_choice = gets.chomp.to_i
        create_objects(second_choice)
      when 1
        puts '0 => add station to the route'
        puts '1 => delete station from the route'
        puts '2 => set route for the train'
        puts '2 => load wagon'
        second_choice = gets.chomp.to_i
        modify_objects(second_choice)
      when 2
        puts '0 => display route stations'
        puts '1 => display trains on a station'
        puts "2 => display train's wagons"
        second_choice = gets.chomp.to_i
        display_objects(second_choice)
      end
    end
    self.choice = 0
  end

  def create_objects(choice)
    case choice
    when 0
      create_station
    when 1
      create_train
    when 2
      create_route
    when 3
      create_wagon
    end
  end

  def modify_objects(choice)
    case choice
    when 0
      add_station
    when 1
      delete_station
    when 2
      set_route
    when 3
      load_wagon
    end
  end

  def display_objects(choice)
    case choice
    when 0
      display_stations
    when 1
      display_trains
    when 2
      display_wagons
    end
  end

  def create_station
    puts 'enter station name:'
    name = gets.chomp
    station = Station.new(name)
  rescue RuntimeError => e
    puts "#{e.message}"
    retry
  ensure
    self.stations.append(station)
    puts "The station with name #{name} was created."
  end

  def create_train
    puts "Enter train's number:"
    number = gets.chomp
    train = Train.new(number)
  rescue RuntimeError => e
    puts "#{e.message}"
    retry
  ensure
    self.trains.append(train)
    puts "The train with number #{number} was created."
  end

  def create_route
    puts 'do you want to use the last 2 stations as
      start station and end station relatively? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y'
      end_station = stations[-1]
      start_station = stations[-2]
    else
      puts 'enter start station name:'
      name = gets.chomp
      start_station = Station.new(name)

      puts 'enter start station name:'
      name = gets.chomp
      end_station = Station.new(name)
    end
    self.route = Route.new(start_station, end_station)
  rescue RuntimeError => e
    puts "#{e.message}"
    retry
  ensure
    self.routes.append(route)
    puts "the route with stations #{start_station.name} #{end_station.name} was created."
  end

  def create_wagon
    puts "type 1 or 2 to create passanger or cargo wagon respectively"
    wagon_type = gets.chomp.to_i

    puts "type wagon's number"
    number = gets.chomp
    if wagon_type == 1
      puts "type number of seats"
      num_of_seats = gets.chomp.to_i
      wagon = PassangerWagon.new(number, num_of_seats)
      self.wagons.append(wagon)
    elsif wagon_type == 2
      puts "type wagon's volume"
      volume = gets.chomp.to_i
      wagon = CargoWagon.new(number, volume)
      self.wagons.append(wagon)
    else
      puts "input can be 1 or 2"
    end
  end



  def add_station
    puts 'do you want to use the last added station? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y' && self.stations.any?
      station = self.stations[-1]
      self.route.add_station(station)
    else
      puts 'enter station name'
      name = gets.chomp
      station = stations.each { |s| s if s.name == name }
      self.route.add_station(station)
    end
  end

  def delete_station
    puts 'enter station name:'
    name = gets.chomp
    self.route.stations.each { |station|
      self.stations.delete(station) if name == station.name
    }
  end

  def set_route
    puts 'do you want to set route to the last created train? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y'
      puts 'do you want to use the last created route? (y/n)'
      binary_choice_2 = gets.chomp
      if binary_choice_2 == 'y'
        route = self.routes[-1] if routes.any?
        self.train.add_route(route)
      end
    else
      puts 'enter train number'
      number = gets.chomp
      train = self.trains.each { |train| train if train.number == number }

      puts 'enter station name:'
      name = gets.chomp
      route.stations.each { |station|
        stations.delete(station) if name == station.name
        }
    end
  end

  def load_wagon
    puts "enter wagon number"
    number = gets.chomp
    idx = 0
    i = 0
    while i < self.trains.length
      idx = i if self.trains[i].number == number
      i += 1
    end
    if self.wagons[idx].class.to_s.eql?('PassangerWagon')
      self.wagons[idx].take_seat
    else
      puts "enter weight of cargo"
      weight = gets.chomp.to_i
      self.wagons[idx].load(weight)
    end
  end

  def display_stations
    puts 'do you want to display the latest added route? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y'
      self.routes[-1].stations.each { |station| puts station.name }
    end
  end

  def display_trains
    puts 'do you want to use the latest added staion? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y'
      self.stations[-1].trains { |train| puts train.number }
    else
      puts 'enter station number'
      name = gets.chomp
      self.station = self.stations.select {|t| t.name == name }.first
      self.station.trains.each { |train| puts train.number }
    end
  end

  def display_wagons
    puts 'do you want to display the latest added train? (y/n)'
    binary_choice = gets.chomp
    if binary_choice == 'y'
      self.trains[-1].each_wagon { |wagon| puts wagon.number }
    else
      puts "enter train's number"
      number = gets.chomp
      self.train = self.trains.select {|t| t.number == number }.first
      self.train.trains.each_wagon { |wagon| puts wagon.number }
    end
  end

end


