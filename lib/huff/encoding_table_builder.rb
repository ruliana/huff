module Huff
  class EncodingTableBuilder
    def initialize(tree)
      @tree = tree
    end

    def table
      Hash[create_table(@tree, '')]
    end

    private

    def create_table(node, code)
      return [[node, code]] if node.is_a? String
      create_table(node.first, code + '0') + create_table(node.last, code + '1')
    end
  end
end