# frozen_string_literal: true

module HexletCode
  # class Form
  class Form
    def initialize(model)
      @model = model
      @tags = []
    end

    def input(entity, options = {})
      options[:name] = entity

      @tags << Object.const_get('HexletCode::Inputs::Label').build(entity) { entity.to_s.capitalize }

      type = options[:as] || 'input'

      options[:value] = @model[entity] unless @model.public_send(entity).nil?

      @tags << Object.const_get("HexletCode::Inputs::#{type.capitalize}").build(options) { @model[entity] }
    end

    def submit(value = 'Save', options = {})
      @tags << Object.const_get('HexletCode::Inputs::Submit').build(value, options)
    end
  end
end
