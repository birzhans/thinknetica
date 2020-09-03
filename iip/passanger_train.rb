require_relative 'train'

class PassangerTrain < Train
  def add_wagon(wagon)
    if wagon.class.to_s.eql?('PassangerWagon')
      super
    end
  end
end


