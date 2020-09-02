require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'cargo_wagon'
require_relative 'passanger_wagon'

choice = 0
stations = []
routes = []
trains = []

while choice != 3
  puts '0 => create objects'
  puts '1 => manipulate created objects'
  puts '2 => display objects'
  puts '3 => quit'
  choice = gets.chomp.to_i

  case choice
  when 0
    puts '0 => create station'
    puts '1 => create train'
    puts '2 => create route'
    choice_0 = gets.chomp.to_i
    case choice_0
    when 0
      puts 'enter station name:'
      name = gets.chomp
      station = Station.new(name)
      stations.append(station)
    when 1
      puts 'enter train number:'
      number = gets.chomp
      train = Train.new(number)
      trains.append(train)
    when 2
      puts 'do you want to use the last 2 stations as
      start station and end station relatively? (y/n)'
      choice_0_2 = gets.chomp
      if choice_0_2 == 'y'
        end_station = stations.pop()
        start_station = stations.pop()
        route = Route.new(start_station, end_station)
        routes.append(route)
      else
        puts 'enter start station name:'
        name = gets.chomp
        start_station = Station.new(name)

        puts 'enter start station name:'
        name = gets.chomp
        end_station = Station.new(name)
      end
    end

  when 1
    puts '0 => add station to the route'
    puts '1 => delete station from the route'
    puts '2 => set route for the train'
    choice_1 = gets.chomp.to_i
    case choice_1
    when 0
      puts 'do you want to use the last added station? (y/n)'
      choice_1_0 = gets.chomp
      if choice_1_0 == 'y' && stations.any?
        station = stations.pop()
        route.add_station(station)
      else
        puts 'enter station name'
        name = gets.chomp
        station = stations.each { |s| s if s.name == name }
        route.add_station(station)
      end
    when 1
        puts 'enter station name:'
        name = gets.chomp
        route.stations.each { |station|
          stations.delete(station) if name == station.name
        }
    when 2
      puts 'do you want to set route to the last created train? (y/n)'
      choice_1_2 = gets.chomp
      if choice_1_2 == 'y'
        puts 'do you want to use the last created route? (y/n)'
        choice_1_2_0 = gets.chomp
        if choice_1_2_0 == 'y'
          route = routes[-1] if routes.any?
          train.add_route(route)
        end
      else
        puts 'enter train number'
        number = gets.chomp
        train = trains.each { |train| train if train.number == number }

        puts 'enter station name:'
        name = gets.chomp
        route.stations.each { |station|
          stations.delete(station) if name == station.name
          }
      end
    end
  when 2
    puts '0 => display route stations'
    puts '1 => display trains on a station'
    choice_2 = gets.chomp.to_i
    case choice_2
    when 0
      puts 'do you want to display the latest added route? (y/n)'
      choice_2_0 = gets.chomp
      if choice_2_0 == 'y'
        routes[-1].stations.each { |station| puts station.name }
      end
    when 1
      puts 'do you want to display the latest added staion? (y/n)'
      choice_2_0 = gets.chomp
      if choice_2_0 == 'y'
        stations[-1].trains { |train| puts train.number }
      else
        puts 'enter station number'
        name = gets.chomp
        station = stations.each { |station| station if station.name == name }
        station.trains.each { |train| puts train.number}
      end
    end
  end
end


