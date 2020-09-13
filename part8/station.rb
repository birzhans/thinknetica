require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation
  attr_reader :name, :trains
  @@stations = []

  def self.all_stations
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations.append(self)
    register_instance
  end

  def each_train
    self.trains.each {|t| yield t }
  end

  def add_train(train)
    trains << train if train.class == Train
  end

  def train_by_type(type)
    trains.each { |train| puts train if train.type.eql?(type) }
  end

  def send_train(train)
    unless trains.empty?
      trains.delete(train)
    end
  end

  private
  # added to private to restrict
  # changig this attributes
  attr_writer :trains
end


