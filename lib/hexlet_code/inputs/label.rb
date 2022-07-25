# frozen_string_literal: true

module HexletCode
  module Inputs
    # class HexletCode
    class Label
      def self.build(entity, &block)
        attrs = {
          for: entity.to_s
        }
        Tag.build('label', attrs, &block)
      end
    end
  end
end
