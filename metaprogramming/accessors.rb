# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
    # base.include InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*instances)
      instances.each do |instance|
        instance_name = "@#{instance}".to_sym
        record_name = "@#{instance}_record".to_sym

        # getter
        define_method(instance) { instance_variable_get(instance_name) }

        # setter
        define_method("#{instance}=") do |value|
          instance_variable_set(instance_name, value)
          if instance_variable_get(record_name).nil?
            instance_variable_set(record_name, [value])
          else
            instance_variable_get(record_name).append(value)
          end
        end

        # attr_history
        define_method("#{instance}_history".to_sym) do
          instance_variable_get(record_name) || []
        end
      end
    end

    def strong_attr_accessor(instance, instance_class)
      instance_name = "@#{instance}".to_sym

      define_method(instance) { instance_variable_get(instance_name) }

      define_method("#{instance}=".to_sym) do |value|
        if value.class.eql?(instance_class)
          instance_variable_set(instance_name, value)
        else
          raise 'type mismatch.'
        end
      end
    end
  end
end
