# frozen_string_literal: true

# module
module HexletCode
  # class HexletCode
  class Submit
    def self.build(value, options)
      {
        name: 'input',
        options: {
          type: 'submit',
          value: value,
          name: 'commit'
        }.merge(options).sort.to_h,
        block: nil
      }
    end
  end
end
