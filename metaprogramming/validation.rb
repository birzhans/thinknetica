# frozen_string_literal: true

module Validation
  def self.included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        send(validation[:valid_type], validation[:attr_name], validation[:option])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def presence(attr_name, *_args)
      attribute = instance_variable_get(attr_name)
      raise ArgumentError, "Can't be nil or empty!" if attribute.nil? || attribute.empty?
    end

    def format(attr_name, form)
      attribute = instance_variable_get(attr_name)
      raise ArgumentError, 'Format mismatch!' if attribute !~ form
    end

    def valid_type(attr_name, attr_type)
      attribute = instance_variable_get(attr_name)
      raise TypeError, 'Type mismatch!' unless attribute.is_a?(attr_type)
    end
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, valid_type, *option)
      attr_name = "@#{name}".to_sym
      self.validations ||= []
      validations << {
        attr_name: attr_name, valid_type: valid_type, option: option[0]
      }
    end
  end
end
