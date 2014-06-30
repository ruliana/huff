module Huff
  class FrequencyMeter
    def initialize(text)
      @text = text
    end

    def frequency
      result = Hash.new { |h, k| h[k] = 0 }
      @text.each_char.
          each_with_object(result) { |char, hash| hash[char] += 1 }.
          map { |c, f| [f, c] }.
          sort { |(f1, _), (f2, _)| f1 <=> f2 }
    end
  end
end