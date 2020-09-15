require_relative 'validation'

module Brand
  def brand=(name)
    validate!
    self.name = name
  end

  def brand
    name
  end

  protected

  attr_accessor :name
end


