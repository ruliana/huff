require 'spec_helper'

include Huff
describe Decoder do
  it 'decodes a string' do
    encoding_tree = ['c', ['b', 'a']]
    subject = Decoder.new(encoding_tree)
    expect(subject.decode_string('11100')).to eq 'abc'
    expect(subject.decode_36('s')).to eq 'abc'
  end

  it 'decodes a more complex string' do
    encoding_tree = [['i', 's'],
                     [['r', 'p'],
                      [['e', ' '],
                       ['m', 'v']]]]
    subject = Decoder.new(encoding_tree)
    expect(subject.decode_string('1110000101000101001010011011000011111100100')).to eq 'mississipi river'
    # Decoding is case insensitive
    expect(subject.decode_36('2QrT5J4ro')).to eq 'mississipi river'
    expect(subject.decode_36('2qRt5j4RO')).to eq 'mississipi river'
  end
end