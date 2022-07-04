module HexletCode

  class << self

    def input_type(entity, result)
      if result[:as]
        type = result[:as].to_s.capitalize 
        result = result.except(:as).sort.to_h
        @tags << const_get("#{type}::BUILD").call(result,type.downcase, entity, @model) { @model[entity] }
      else
        default_type(result, entity)
      end
    end

    def default_type(result, entity)
      result[:value] = @model[entity] unless @model.public_send(entity).nil?
      @tags << Tag.build('input', result.merge(const_get("SimpleText::SIMPLE_TEXT")).sort.to_h)
    end
  end
end