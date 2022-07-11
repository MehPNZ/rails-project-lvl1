# frozen_string_literal: true

require_relative '../hexlet_code/version'
require_relative '../../lib/hexlet_code/tag'
require_relative '../../lib/hexlet_code/text_area'
require_relative '../../lib/hexlet_code/simple_text'

# base module
module HexletCode
  # class HexletCode
  class << self
    def submit(name = 'Save')
      @tags << Tag.build('input', name: 'commit', type: 'submit', value: name)
    end

    def form_for(model, url = nil)
      @tags = []
      @model = model
      action = url.nil? ? '#' : url[:url]
      result = yield(self)
      Tag.build('form', action: action, method: 'post') { result.map(&:to_s).join }
    end

    def label_tag(entity)
      @tags << Tag.build('label', for: entity.to_s) { entity.to_s.capitalize }
    end

    def input_type(entity, result)
      if result[:as]
        type = result[:as].to_s.capitalize
        result = result.except(:as).sort.to_h
        @tags << const_get(type.to_s).build(result) { @model[entity] }
      else
        default_type(result, entity)
      end
    end

    private

    def default_type(result, entity)
      result[:value] = @model[entity] unless @model.public_send(entity).nil?
      @tags << Tag.build('input', result.merge(const_get('SimpleText::SIMPLE_TEXT')).sort.to_h)
    end
  end
end
