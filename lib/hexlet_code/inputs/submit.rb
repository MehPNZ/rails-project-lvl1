# frozen_string_literal: true

# module
module HexletCode
  module Inputs
    # class HexletCode
    class Submit
      def self.build(value, options)
        attrs = {
          type: 'submit',
          value: value,
          name: 'commit'
        }
        Tag.build('input', attrs.merge(options).sort.to_h)
      end
    end
  end
end
