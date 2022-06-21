# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative '../lib/hexlet_code/tag'
# module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, './hexlet_code/tag')

  class << self
    INPUT = {
      type: 'text'
    }.freeze

    def form_for(model, url = nil)
      @tags = []
      action = url.nil? ? '#' : url[:url]
      @model = model
      result = yield(self)
      Tag.build('form', action: action, method: 'post') { result.map { |el| "\n  #{el}" }.join.squeeze("\n") }
    end

    def input(entity, attrs = {})
      @tags << Tag.build('label', for: entity.to_s) { entity.to_s.capitalize }

      result = attrs
      result[:name] = entity

      if result.include?(:as)
        result = attrs.except(:as).sort.to_h
        @tags << Tag.build('textarea', result) { @model[entity] }
      else
        result[:value] = @model[entity] unless @model.public_send(entity).nil?
        @tags << Tag.build('input', result.merge(INPUT).sort.to_h)
      end
    end

    def submit(name = 'Save')
      @tags << Tag.build('input', name: 'commit', type: 'submit', value: name)
    end
end
end
