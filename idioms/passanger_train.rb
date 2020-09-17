# frozen_string_literal: true

require_relative 'train'

class PassangerTrain < Train
  def add_wagon(wagon)
    super if wagon.class.to_s.eql?('PassangerWagon')
  end
end
