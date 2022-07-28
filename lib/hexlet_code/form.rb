# frozen_string_literal: true

module HexletCode
  # class Form
  class Form

    def initialize(model)
      @model = model
      @inputs = []
    end

    def input(entity, options = {})
      options[:name] = entity

      @inputs << Object.const_get('HexletCode::Label').build(entity)

      type = options[:as] || 'input'

      options[:value] = @model[entity] unless @model.public_send(entity).nil?

      @inputs << Object.const_get("HexletCode::#{type.capitalize}").build(options)
    end

    def submit(value = 'Save', options = {})
      @inputs << Object.const_get('HexletCode::Submit').build(value, options)
    end
  end
end
