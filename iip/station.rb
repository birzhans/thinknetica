class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train if train.class == Train
  end

  def train_by_type(type)
    trains.each { |train| puts train if train.type.eql?(type) }
  end

  def send_train(train)
    unless trains.empty?
      puts "The train #{train} was sent."
      trains.delete(train)
    end
  end

  private
  # added to private to restrict
  # changig this attributes
  attr_writer :trains

end
