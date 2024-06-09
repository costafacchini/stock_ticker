require 'rails_helper'

RSpec.describe Statistics, type: :model do
  it "calculates the average" do
    statistics = described_class.new(label: 'label', maximum: 10.0, minimum: 4.0)

    expect(statistics.average).to eql 7.0
  end
end