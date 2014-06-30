require 'spec_helper'

include Huff
describe EncodingTableBuilder do
  it 'creates a encoding table from a encoding tree' do
    enconding_tree = ['c', ['b', 'a']]
    subject = EncodingTableBuilder.new(enconding_tree)
    expect(subject.table).to eq({'c' => '0', 'b' => '10', 'a' => '11'})
  end

  it 'creates a encoding table from a more comples encoding tree' do
    enconding_tree = [['i', 's'],
                      [['r', 'p'],
                       [['e', ' '],
                        ['m', 'v']]]]
    subject = EncodingTableBuilder.new(enconding_tree)
    expect(subject.table).to eq({'i' => '00',
                                 's' => '01',
                                 'r' => '100',
                                 'p' => '101',
                                 'e' => '1100',
                                 ' ' => '1101',
                                 'm' => '1110',
                                 'v' => '1111'})
  end
end