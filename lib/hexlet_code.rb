# frozen_string_literal: true

require_relative '../lib/hexlet_code/base'

# module
module HexletCode
  class Error < StandardError; end

  class << self
    def input(entity, options = {})
      result = options
      result[:name] = entity

      label_tag(entity)

      input_type(entity, result)
    end
  end
end
