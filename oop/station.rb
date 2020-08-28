class Station
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def freight_trains
    trains.each { |train|
      puts train if train.type == 'freight'
    }
  end

  def passanger_trains
    trains.each { |train|
      puts train if train.type == 'passanger'
    }
  end

  def send_train
    unless trains.empty?
      puts "The train #{trains[0].number} was sent."
      trains.drop(1)
    end
  end
end


