require_relative 'wagon'

class PassangerWagon < Wagon
  def load
    self.available_volume -= 1
  end
end


