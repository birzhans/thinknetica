require_relative 'train'

class CargoTrain < Train
  def add_wagon(wagon)
    super if wagon.class.to_s.eql?('CargoWagon')
  end
end


