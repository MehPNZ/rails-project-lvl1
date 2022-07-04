# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative '../lib/hexlet_code/tag'
require_relative '../lib/hexlet_code/text_area'
require_relative '../lib/hexlet_code/input_type'
require_relative '../lib/hexlet_code/checkbox'
require_relative '../lib/hexlet_code/simple_text'
# module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, './hexlet_code/tag')

  class << self

    def input(entity, options = {})
      @tags << Tag.build('label', for: entity.to_s) { entity.to_s.capitalize }

      result = options
      result[:name] = entity

      input_type(entity, result)
    end

    def submit(name = 'Save')
      @tags << Tag.build('input', name: 'commit', type: 'submit', value: name)
    end
end
end
