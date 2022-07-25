# frozen_string_literal: true

# module
module HexletCode
  # class HexletCode
  class << self
    def submit(value = 'Save', options = {})
      attrs = {
        type: 'submit',
        value: value,
        name: 'commit'
      }

      @tags << Tag.build(@name, attrs.merge(options).sort.to_h)
    end
  end
end
