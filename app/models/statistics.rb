# frozen_string_literal: true

class Statistics
  attr_reader :label, :maximum, :minimum, :average, :format_to_money

  def initialize(label:, maximum:, minimum:, format_to_money: false)
    @label = label
    @format_to_money = format_to_money
    @maximum = maximum
    @minimum = minimum
    @average = (@maximum + @minimum) / 2
  end
end
