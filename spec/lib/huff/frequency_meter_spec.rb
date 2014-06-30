require 'spec_helper'
include Huff

describe FrequencyMeter do
  it 'count symbols' do
    symbols = "aaábbb\n"
    subject = FrequencyMeter.new(symbols)
    expect(subject.frequency).to eq [[1, "\n"], [1, 'á'], [2, 'a'], [3, 'b']]
  end
end