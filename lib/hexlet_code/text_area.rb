# frozen_string_literal: true

# module
module HexletCode

  class Text
  BUILD = ->(result, type = nil, entity = nil, model = nil, &block) { Tag.build('textarea', result, &block) }
  end

end