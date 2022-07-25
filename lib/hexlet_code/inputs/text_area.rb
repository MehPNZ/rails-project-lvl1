# frozen_string_literal: true

# module
module HexletCode
  module Inputs
    # textarea
    class Text
      def self.build(result, &block)
        Tag.build('textarea', result.except(:as, :value).sort.to_h, &block)
      end
    end
  end
end
