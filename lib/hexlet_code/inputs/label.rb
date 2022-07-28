# frozen_string_literal: true

module HexletCode
  module Inputs
    # class HexletCode
    class Label
      def self.build(entity)
        {
          name: 'label',
          options: {
            for: entity.to_s
          },
          block: entity.to_s.capitalize
        }
      end
    end
  end
end
