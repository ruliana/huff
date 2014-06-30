require 'spec_helper'

include Huff
describe EncodingTreeBuilder do
  it 'build a Huffman tree from frequencies' do
    frequencies = [[1, 'a'], [2, 'b'], [3, 'c']]
    subject = EncodingTreeBuilder.new(frequencies)
    expect(subject.tree).to eq [6, 'cba', [3, 'c'], [3, 'ba', [2, 'b'], [1, 'a']]]
  end

  it 'builds a simplified Huffman tree' do
    frequencies = [[1, 'a'], [2, 'b'], [3, 'c']]
    subject = EncodingTreeBuilder.new(frequencies)
    expect(subject.simplified_tree).to eq ['c', ['b', 'a']]
  end

  it 'builds a simplified Huffman for more complex frequencies' do
    frequencies = [[1, ' '],
                   [1, 'e'],
                   [1, 'v'],
                   [1, 'm'],
                   [2, 'r'],
                   [2, 'p'],
                   [4, 's'],
                   [5, 'i']]
    subject = EncodingTreeBuilder.new(frequencies)
    expect(subject.simplified_tree).to eq [['i', 's'],
                                           [['r', 'p'],
                                            [['e', ' '],
                                             ['m', 'v']]]]
  end
end