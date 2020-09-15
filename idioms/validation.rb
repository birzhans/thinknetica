module Validation
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "#{self.class} name is not given." if name.nil?
    raise "#{self.class} name can't be empty string." if name.empty?
  end
end


