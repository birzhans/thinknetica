module Brand
  def set_brand(brand_name)
    self.brand_name = brand_name
  end

  def get_brand
    self.brand_name
  end

  protected
  attr_accessor :brand_name
end


