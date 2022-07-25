# frozen_string_literal: true

require_relative '../lib/hexlet_code/inputs/text_area'
require_relative '../lib/hexlet_code/inputs/submit'
require_relative '../lib/hexlet_code/inputs/input'
require_relative '../lib/hexlet_code/inputs/label'
require_relative '../lib/hexlet_code/tag'
require_relative '../lib/hexlet_code/form'
require_relative '../lib/hexlet_code/version'

# module
module HexletCode
  class Error < StandardError; end

  def self.form_for(model, options = {})
    attrs = {
      action: options[:url].nil? ? '#' : options[:url],
      method: 'post'
    }

    form = Form.new(model)

    result = yield(form)

    Tag.build('form', attrs.sort.to_h) { result.join }
  end
end
