# frozen_string_literal: true

# module
module HexletCode
  module Inputs
    # textarea
    class Text
      def self.build(options)
        {
          name: 'textarea',
          options: options.except(:as, :value).sort.to_h,
          block: options[:value] || ''
        }
      end
    end
  end
end
