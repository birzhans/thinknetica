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
      if attribute.nil? || attribute.empty?
        raise ArgumentError, "Can't be nil or empty!"
      else
        puts 'Presence: OK'
      end
    end

    def format(attr_name, form)
      attribute = instance_variable_get(attr_name)
      if attribute =~ form
        puts 'Format: OK'
      else
        raise ArgumentError, 'Format mismatch!'
      end
    end

    def type(attr_name, attr_type)
      attribute = instance_variable_get(attr_name)
      if attribute.is_a?(attr_type)
        puts 'Type: OK'
      else
        raise TypeError, 'Type mismatch!'
      end
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
