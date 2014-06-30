module Huff
  class Decoder
    def initialize(encoding_tree)
      @encoding_tree = encoding_tree
    end

    def decode_string(text)
      text_array = text.each_char.to_a
      result = ''
      until text_array.empty?
        letter, text_array = decode(@encoding_tree, text_array)
        result << letter
      end
      result
    end

    def decode_36(text)
      decode_string(text.to_i(36).to_s(2))
    end

    private

    def decode(tree, text)
      return [tree, text] if tree.is_a? String
      it, *rest = text
      case it
        when '0'
          decode(tree.first, rest)
        when '1'
          decode(tree.last, rest)
        else
          throw "Expecting 0 or 1, got '#{it}'."
      end
    end
  end
end