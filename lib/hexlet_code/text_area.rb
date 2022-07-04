# frozen_string_literal: true

# module
module HexletCode
  class Text
    BUILD = lambda do |*args, &block|
      result, * = args
      Tag.build('textarea', result, &block)
    end
  end
end
