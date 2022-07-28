# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class input
    class Input
      def self.build(options)
        {
          name: 'input',
          options: { type: 'text' }.merge(options).sort.to_h,
          block: nil
        }
      end
    end
  end
end
