# frozen_string_literal: true

require_relative '../lib/hexlet_code/version'

# module
module HexletCode
  autoload(:Form, 'hexlet_code/form.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  class Error < StandardError; end

  def self.form_for(model, options = {})
    attrs = {
      action: options[:url].nil? ? '#' : options[:url],
      method: 'post'
    }

    form = Form.new(model)

    result = yield(form)

    Tag.build('form', attrs.sort.to_h) { result.map { |el| Tag.build(el[:name], el[:options]) { el[:block] } }.join }
  end
end
