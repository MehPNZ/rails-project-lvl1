# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class input
    class Input
      def self.build(result)
        result[:type] = 'text'
        Tag.build('input', result.sort.to_h)
      end
    end
  end
end
