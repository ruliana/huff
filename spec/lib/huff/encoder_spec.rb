require 'spec_helper'

include Huff
describe Encoder do
  it 'encode a string' do
    encoding_tree = ['c', ['b', 'a']]
    subject = Encoder.new(encoding_tree)
    expect(subject.encode_string('abc')).to eq '11100'
    expect(subject.encode_36('abc')).to eq 'S'
  end

  it 'encode a more complex string' do
    encoding_tree = [['i', 's'],
                     [['r', 'p'],
                      [['e', ' '],
                       ['m', 'v']]]]
    subject = Encoder.new(encoding_tree)
    expect(subject.encode_string('mississipi river')).to eq '1110000101000101001010011011000011111100100'
    expect(subject.encode_36('mississipi river')).to eq '2QRT5J4RO'
  end
end