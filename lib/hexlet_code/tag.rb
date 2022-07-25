# frozen_string_literal: true

# module
module HexletCode
  # class Tag
  class Tag
    def self.build(tag, *attributes, &block)
      return %(<#{tag}>) if attributes.empty?

      arr = []
      attrs, * = attributes

      attrs.each_pair { |key, value| arr << %(#{key}="#{value}") }

      block ? %(<#{tag} #{arr.join(' ')}>#{yield}</#{tag}>) : %(<#{tag} #{arr.join(' ')}>)
    end
  end
end
