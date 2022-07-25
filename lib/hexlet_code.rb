# frozen_string_literal: true

require_relative '../lib/hexlet_code/version'
require_relative '../lib/hexlet_code/text_area'
require_relative '../lib/hexlet_code/submit'
require_relative '../lib/hexlet_code/input'

# module
module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'

  class << self
    def form_for(model, options = {})
      @tags = []
      @name = 'input'
      @model = model

      attrs = {
        action: options[:url].nil? ? '#' : options[:url],
        method: 'post'
      }

      result = yield(self)
      Tag.build('form', attrs.merge(options.except(:url)).sort.to_h) { result.map(&:to_s).join }
    end
  end
end
