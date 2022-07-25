# frozen_string_literal: true

# base input
module HexletCode
  # class HexletCode
  class << self
    def input(entity, options = {})
      @name = 'input'
      options[:name] = entity

      label_tag(entity)

      input_type(entity, options)
    end

    def label_tag(entity, options = {})

      attrs = {
        for: entity.to_s
      }

      @tags << Tag.build('label', attrs.merge(options).sort.to_h) { entity.to_s.capitalize }
    end

    def input_type(entity, options)
      if options[:as]
        type = options[:as].to_s.capitalize
        options = options.except(:as).sort.to_h
        @tags << const_get(type.to_s).build(options) { @model[entity] }
      else
       default_type(entity, options)
      end
    end

    private

    def default_type(entity, options)
      options[:value] = @model[entity] unless @model.public_send(entity).nil?
      options[:type] = 'text'
      @tags << Tag.build(@name, options.sort.to_h)
    end
  end
end
