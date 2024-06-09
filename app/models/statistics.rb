class Statistics
  attr_reader :label, :maximum, :minimum, :average

  def initialize(label:, maximum:, minimum:)
    @label = label
    @maximum = maximum
    @minimum = minimum
    @average = (@maximum + @minimum) / 2
  end
end