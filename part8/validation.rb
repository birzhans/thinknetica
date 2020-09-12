module Validation
  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "#{self.class.to_s} name is not given." if name.nil?
    raise "#{self.class.to_s} name can't be empty string." if name.empty?
  end
end
