# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistics do
  it 'calculates the average' do
    statistics = described_class.new(label: 'label', maximum: 10.0, minimum: 4.0)

    expect(statistics.average).to be 7.0
  end
end
