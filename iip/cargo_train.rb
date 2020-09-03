require_relative 'train'

class CargoTrain < Train
  def add_wagon(wagon)
    if wagon.class.to_s.eql?('CargoWagon')
      super
    end
  end
end


