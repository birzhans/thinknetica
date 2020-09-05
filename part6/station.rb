require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations.append(self)
    register_instance
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


