module HexletCode
  # class Tag

  class Checkbox
    BUILD = lambda do |result, type, entity, model| 
      result[:value] = model[entity] unless model.public_send(entity).nil?
      result[:type] = type
      Tag.build('input', result.sort.to_h)
    end
  end
end