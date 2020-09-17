# frozen_string_literal: true

require_relative 'wagon'

class PassangerWagon < Wagon
  def load(*)
    super(1)
  end
end
