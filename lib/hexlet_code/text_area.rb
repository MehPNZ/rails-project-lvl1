# frozen_string_literal: true

# module
module HexletCode
  # textarea
  class Text
    def self.build(result, &block)
      Tag.build('textarea', result, &block)
    end
  end
end
