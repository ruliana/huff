module Huff
  class EncodingTreeBuilder
    def initialize(frequencies)
      @frequencies = frequencies
    end

    def tree
      create_tree(@frequencies).first
    end

    def simplified_tree
      simplify(tree)
    end

    private

    def create_tree(freqs)
      return freqs if freqs.size == 1
      freqs = sort_frequency(freqs)

      (f1, c1, *r1), (f2, c2, *r2), *rest = freqs
      node = [f2 + f1, c2 + c1, [f2, c2, *r2], [f1, c1, *r1]]

      create_tree([node] + rest)
    end

    def sort_frequency(freqs)
      freqs.sort do |(f1, c1), (f2, c2)|
        # We sort by size on tie to create
        # the shallowest tree possible.
        x = f1 <=> f2
        x == 0 ? c2.size <=> c1.size : x
      end
    end

    def simplify(freqs)
      _, chars, b1, b2 = freqs
      if b1
        [simplify(b1), simplify(b2)]
      else
        chars
      end
    end
  end
end