# frozen_string_literal: true

module HexletCode
  # class Form
  class Form
    autoload(:Label, 'inputs/label.rb')
    autoload(:Input, 'inputs/input.rb')
    autoload(:Text, 'inputs/textarea.rb')
    autoload(:Submit, 'inputs/submit.rb')

    def initialize(model)
      @model = model
      @inputs = []
    end

    def input(entity, options = {})
      options[:name] = entity

      @inputs << Object.const_get('HexletCode::Inputs::Label').build(entity)

      type = options[:as] || 'input'

      options[:value] = @model[entity] unless @model.public_send(entity).nil?

      @inputs << Object.const_get("HexletCode::Inputs::#{type.capitalize}").build(options)
    end

    def submit(value = 'Save', options = {})
      @inputs << Object.const_get('HexletCode::Inputs::Submit').build(value, options)
    end
  end
end
