require_relative 'validation'

module Brand
  def set_brand(name)
    validate!
    self.name = name
  end

  def get_brand
    self.name
  end

  protected
  attr_accessor :name
end


