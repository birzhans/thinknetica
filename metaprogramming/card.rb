# frozen_string_literal: true

require_relative 'accessors'
require_relative 'validation'

class Card
  include Accessors
  include Validation
  attr_accessor_with_history :balance, :number
  strong_attr_accessor :holder, String

  validate :holder, :presence
  validate :number, :format, /./
  validate :balance, :valid_type, Integer

  def balance?
    balance.positive?
  end

  def deposit(amount)
    self.balance += 100 if amount.positive?
  end

  def withdraw(amount)
    self.balance -= amount if amount.negative?
  end
end
