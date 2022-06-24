# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative '../lib/hexlet_code/tag'
# module
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, './hexlet_code/tag')

  class TEXT
    BUILD = ->(result, &block) { Tag.build('textarea', result, &block) }
  end

  class << self
    INPUT = {
      type: 'text'
    }.freeze

    def form_for(model, url = nil)
      @tags = []
      @model = model
      action = url.nil? ? '#' : url[:url]
      result = yield(self)
      Tag.build('form', action: action, method: 'post') { result.map(&:to_s).join }
    end

    def input(entity, attrs = {})
      @tags << Tag.build('label', for: entity.to_s) { entity.to_s.capitalize }

      result = attrs
      result[:name] = entity

      as?(entity, result, attrs)
    end

    def as?(entity, result, attrs)
      if result.include?(:as)
        type = result[:as].to_s.upcase
        result = attrs.except(:as).sort.to_h
        @tags << const_get("#{type}::BUILD").call(result) { @model[entity] }
      else
        input_build(result, entity)
      end
    end

    def input_build(result, entity)
      result[:value] = @model[entity] unless @model.public_send(entity).nil?
      @tags << Tag.build('input', result.merge(INPUT).sort.to_h)
    end

    def submit(name = 'Save')
      @tags << Tag.build('input', name: 'commit', type: 'submit', value: name)
    end
end
end
