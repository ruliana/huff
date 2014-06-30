module Huff
  class Encoder
    def initialize(tree)
      @table = EncodingTableBuilder.new(tree).table
    end

    def encode_string(text)
      text.each_char.each_with_object('') do |char, result|
        result << @table[char]
      end
    end

    def encode_36(text)
      encode_string(text).to_i(2).to_s(36).upcase
    end
  end
end