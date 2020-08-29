class Station
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def train_by_type(type)
    trains.each { |train| puts train if train.type == type }
  end

  def send_train(train)
    unless trains.empty?
      puts "The train #{train} was sent."
      trains.remove(train)
    end
  end
end


